<#
.SYNOPSIS
  Add tags to migrated posts that have none, derived from title/content keywords
  and aligned to the blog's existing (lowercase) tag vocabulary.
  Only touches posts with no `tags:` line; leaves already-tagged posts alone.
#>
$dir = Join-Path (Split-Path $PSScriptRoot -Parent) "content\posts"
$files = Get-ChildItem $dir -Filter *.md | Where-Object { $_.Name -ne '_index.md' }

$map = [ordered]@{
  'd365bc'         = @('business central',' bc ','d365bc','bcopensource','navision','dynamics nav',' nav ',' al ','al language','al extension','al code','bc mcp')
  'd365'           = @('dynamics 365',' d365','dynamics crm','customer engagement')
  'power bi'       = @('power bi','powerbi')
  'power automate' = @('power automate',' flow ','cloud flow')
  'power platform' = @('power platform','power apps','powerapps','dataverse','canvas app')
  'm365'           = @('m365','office 365','office365','microsoft 365','sharepoint','onedrive')
  'exchange'       = @('exchange','outlook',' owa ','thunderbird')
  'ms teams'       = @('microsoft teams',' ms teams',' teams ')
  'azure'          = @('azure','entra','active directory',' aad ')
  'ai'             = @('copilot','chatgpt',' ai ','artificial intelligence',' llm ',' mcp ','model context protocol','openai','gpt')
  'sql'            = @('sql server',' sql ','t-sql','tsql','ssms','database query')
  'ssrs'           = @('ssrs','reporting services','report builder','rdl')
  'powershell'     = @('powershell','cmdlet')
  'ubuntu'         = @('ubuntu',' linux ','debian','bash ','apt-get','grub')
  'qnap'           = @('qnap',' nas ','synology','raid')
  'networking'     = @('smtp','telnet','voip',' pbx ','3cx',' dns ',' vpn ',' smb ','tcp/ip','port forward','router','firewall')
  'security'       = @('security','compliance','credssp',' tls ',' ssl ','certificate','encryption','2fa','mfa')
  'source control' = @('github',' git ','svn','subversion','source control','version control')
  'simple dev'     = @(' c# ','.net','visual studio','vs code','rest api',' soap ','wsdl','web service','javascript',' php ','wordpress','mysql','api ','vibe coding')
  'windows'        = @('windows',' hyperv','hyper-v','wsl',' vm ','virtual machine','remote desktop',' rdp ')
  'excel'          = @('excel','spreadsheet','.xlsx','power query')
  'word'           = @('microsoft word','.docx','word document')
  'blackberry'     = @('blackberry')
  'talks'          = @('d365ppug','user group','presenting','presentation','session','conference','meetup','directions')
  'mvp'            = @('microsoft mvp',' mvp ','mvp award','mvp renewal')
  'brautag'        = @('brautag','brew day','homebrew','grainfather','fermentation')
  'backup'         = @('backup','veeam','restore','disaster recovery')
  'web'            = @('blogger','website','webmaster','favicon',' html ',' css ','firefox','chrome browser','web page')
}

$utf8 = New-Object System.Text.UTF8Encoding($false)
$updated = 0
foreach ($f in $files) {
  $text = [System.IO.File]::ReadAllText($f.FullName)
  $lines = $text -split "`r?`n"
  $fmEnd = -1
  for ($i = 1; $i -lt $lines.Count; $i++) { if ($lines[$i] -eq '---') { $fmEnd = $i; break } }
  if ($fmEnd -lt 0) { continue }
  $fm = $lines[1..($fmEnd-1)]
  $body = ($lines[($fmEnd+1)..($lines.Count-1)] -join "`n")
  if ($fm | Where-Object { $_ -match '^tags:\s*\[.+\]' }) { continue }

  $titleLine = ($fm | Where-Object { $_ -match '^title:' }) -replace '^title:\s*"?(.*?)"?\s*$','$1'
  $hay = (' ' + ($titleLine + ' ' + ($body -replace '<[^>]+>',' ')).ToLower() + ' ')
  $tags = @()
  foreach ($tag in $map.Keys) { foreach ($kw in $map[$tag]) { if ($hay.Contains($kw)) { $tags += $tag; break } } }
  $tags = $tags | Select-Object -Unique | Select-Object -First 6
  if ($tags.Count -eq 0) { continue }

  $tagYaml = 'tags: [' + (($tags | ForEach-Object { '"' + $_ + '"' }) -join ', ') + ']'
  $newFm = @(); $inserted = $false
  foreach ($l in $fm) { if (-not $inserted -and $l -match '^author:') { $newFm += $tagYaml; $inserted = $true }; $newFm += $l }
  if (-not $inserted) { $newFm += $tagYaml }
  $out = "---`n" + ($newFm -join "`n") + "`n---`n" + $body.TrimStart("`n") + "`n"
  [System.IO.File]::WriteAllText($f.FullName, $out, $utf8)
  $updated++
}
Write-Host "Posts newly tagged: $updated"
