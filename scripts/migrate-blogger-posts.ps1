<#
.SYNOPSIS
  Migrate Microsoft/tech/Business Central/brewing posts from a Blogger Atom export
  into Hugo markdown under content/posts.

.NOTES
  - Classifies each live post as INCLUDE / EXCLUDE / REVIEW (only INCLUDE is written).
  - Preserves the original Blogger URL exactly via the `url` front matter
    (from blogger:filename, e.g. /YYYY/MM/slug.html).
  - Promotes the first Blogger-hosted image to `hero` and removes it from the body.
  - Reads the Atom file with XmlDocument.Load so UTF-8 (emoji/£) decodes correctly
    (Get-Content -Raw in PS 5.1 is ANSI and mangles multibyte chars).
  - Idempotent: clears existing content/posts/*.md (except _index.md) then rewrites.

  Set $Feed to your export path before running. Re-run safely at any time.
#>

$Feed   = "c:\AI\Blog Migration\Blogger\Blogs\Wingate365.com\feed.atom"
$Repo   = Split-Path $PSScriptRoot -Parent
$OutDir = Join-Path $Repo "content\posts"

$x = New-Object System.Xml.XmlDocument
$x.Load($Feed)
$ns = @{ a='http://www.w3.org/2005/Atom'; b='http://schemas.google.com/blogger/2018' }
$posts = Select-Xml -Xml $x -Namespace $ns -XPath "//a:entry[b:type='POST' and b:status='LIVE']" | ForEach-Object { $_.Node }

$includeLabels = @('d365bc','d365','al','bcopensource','api','admin api','power bi','power automate','power platform','m365','ms teams','azure','sql','c#','.net','copilot','ai','chatgpt','graph','exchange','windows','ubuntu','aws','compliance','security','licenses','alm','logging','user admin','admin','web','simple dev','vibe coding','ssrs','erp','d365ppug','excel','word','data','db','qnap','cloud-backup','rss','ux/ui','mobile','blackberry','end user to consultant','talks','community','brautag')
$excludeLabels = @('films','travel','food','dundee','swansea','outdoors','funny','books','music','rpg','science','teaching','about me')
$strongKw = @('business central','dynamics 365','dynamics nav','navision','bcopensource','power bi','power automate','power apps','power platform','powershell','sharepoint','office 365','microsoft 365',' m365','azure','copilot','chatgpt',' mcp ','dataverse','entra','active directory','exchange online','microsoft teams',' ms teams','asp.net','.net framework','.net core','dotnet',' c# ','github','vs code','visual studio','graph api',' api ','sql server','ssrs','ubuntu',' ssh',' linux','windows server','docker','kubernetes','qnap',' nas ','synology','raspberry pi','office365',' erp ',' crm ','al language','al extension','microsoft mvp',' d365',' bc ','onedrive','sql ','smtp','telnet',' soap ','wsdl','voip',' pbx ','3cx','virtual machine',' vm ',' smb ','thunderbird','vtiger','wordpress','mysql','javascript',' php ',' html','router','firewall','raspberry','docker',' rdp',' vpn',' dns',' ssl','.iso','iso image','mount iso','remote desktop','screen shar','backup',' nas ','rss feed','rest api','web service','soap/rest')
$brewKw = @('brautag','brew day','homebrew','grainfather','fermentation','wort chiller','hop schedule')

function Get-Labels($p) {
  $p.ChildNodes | Where-Object { $_.LocalName -eq 'category' } | ForEach-Object { $_.Attributes['term'].Value } | Where-Object { $_ -and $_ -notlike 'http*' }
}
function Yaml-Escape($s) { return ($s -replace '\\','\\' -replace '"','\"') }
function To-Iso($s) { try { return ([datetime]$s).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ") } catch { return $null } }

Get-ChildItem $OutDir -Filter *.md | Where-Object { $_.Name -ne '_index.md' } | Remove-Item -Force

$utf8 = New-Object System.Text.UTF8Encoding($false)
$written = 0; $withHero = 0

foreach ($p in $posts) {
  $title   = ($p.ChildNodes | Where-Object { $_.LocalName -eq 'title' }).InnerText
  $path    = ($p.ChildNodes | Where-Object { $_.LocalName -eq 'filename' }).InnerText
  $pub     = ($p.ChildNodes | Where-Object { $_.LocalName -eq 'published' }).InnerText
  $upd     = ($p.ChildNodes | Where-Object { $_.LocalName -eq 'updated' }).InnerText
  $content = ($p.ChildNodes | Where-Object { $_.LocalName -eq 'content' }).InnerText
  if ($null -eq $content) { $content = '' }
  $labels  = @(Get-Labels $p)

  $plain = ($content -replace '<[^>]+>',' ')
  $hay = ($title + ' ' + $plain).ToLower()
  $labelsLower = $labels | ForEach-Object { $_.ToLower() }
  $incByLabel = @($labelsLower | Where-Object { $includeLabels -contains $_ })
  $incByKw    = @($strongKw | Where-Object { $hay.Contains($_) })
  $brewHit    = @($brewKw   | Where-Object { $hay.Contains($_) })
  $hasInclude = ($incByLabel.Count -gt 0) -or ($incByKw.Count -gt 0) -or ($brewHit.Count -gt 0)
  $isAbout = ($title -match '^\s*about\b')
  if ($isAbout -or -not $hasInclude) { continue }

  if ($path -notmatch '^/(\d{4})/(\d{2})/(.+)\.html$') { continue }
  $yr = $Matches[1]; $mo = $Matches[2]; $slug = $Matches[3]
  $url = $path
  $mdName = "$yr-$mo-$slug.md"

  $date = To-Iso $pub
  $lastmod = To-Iso $upd
  if (-not $date) { $date = To-Iso $upd }

  $tags = @($labels | Where-Object { $_.ToLower() -ne 'images' } | ForEach-Object { $_.ToLower() } | Select-Object -Unique)

  $hero = $null
  $imgMatch = [regex]::Match($content, '<img\b[^>]*?src=["'']([^"'']+)["''][^>]*>', 'IgnoreCase')
  if ($imgMatch.Success) {
    $src = $imgMatch.Groups[1].Value
    if ($src -match 'googleusercontent\.com' -or $src -match 'bp\.blogspot\.com') {
      $hero = $src
      $tag = $imgMatch.Value
      $anchorPat = '<a\b[^>]*>\s*' + [regex]::Escape($tag) + '\s*</a>'
      $rxA = [regex]::new($anchorPat, 'IgnoreCase')
      if ($rxA.IsMatch($content)) { $content = $rxA.Replace($content, '', 1) }
      else { $content = [regex]::new([regex]::Escape($tag)).Replace($content, '', 1) }
      $content = [regex]::Replace($content, '<div class="separator"[^>]*>\s*</div>', '', 'IgnoreCase')
      $content = [regex]::Replace($content, '^\s*(<br\s*/?>\s*)+', '', 'IgnoreCase')
    }
  }

  $fm = @('---')
  $fm += 'title: "' + (Yaml-Escape $title) + '"'
  $fm += 'date: ' + $date
  if ($lastmod -and $lastmod -ne $date) { $fm += 'lastmod: ' + $lastmod }
  $fm += 'url: "' + $url + '"'
  if ($tags.Count -gt 0) { $fm += 'tags: [' + (($tags | ForEach-Object { '"' + (Yaml-Escape $_) + '"' }) -join ', ') + ']' }
  if ($hero) { $fm += 'hero: "' + $hero + '"' }
  $fm += 'author: "Andy Wingate"'
  $fm += '---'
  $fm += ''

  $out = ($fm -join "`n") + $content.Trim() + "`n"
  [System.IO.File]::WriteAllText((Join-Path $OutDir $mdName), $out, $utf8)
  $written++
  if ($hero) { $withHero++ }
}

Write-Host "Posts written: $written (with hero: $withHero, placeholder: $($written - $withHero))"
