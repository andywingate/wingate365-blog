<#
.SYNOPSIS
  Normalise all post tags to lowercase (single-line YAML arrays).
.NOTES
  Uses -cne (case-SENSITIVE) for the change check: PowerShell's default -ne is
  case-insensitive, so "power bi" -ne "Power BI" is False and would skip writes.
#>
$dir = Join-Path (Split-Path $PSScriptRoot -Parent) "content\posts"
$files = Get-ChildItem $dir -Filter *.md | Where-Object { $_.Name -ne '_index.md' }
$utf8 = New-Object System.Text.UTF8Encoding($false)
$changed = 0

$evaluator = [System.Text.RegularExpressions.MatchEvaluator]{
  param($m)
  $vals = [regex]::Matches($m.Groups[1].Value, '"([^"]*)"') |
          ForEach-Object { $_.Groups[1].Value.ToLower().Trim() } |
          Where-Object { $_ } | Select-Object -Unique
  'tags: [' + (($vals | ForEach-Object { '"' + $_ + '"' }) -join ', ') + ']'
}

foreach ($f in $files) {
  $text = [System.IO.File]::ReadAllText($f.FullName)
  $new = [regex]::Replace($text, '(?m)^tags:\s*\[(.*)\]\s*$', $evaluator)
  if ($new -cne $text) {
    [System.IO.File]::WriteAllText($f.FullName, $new, $utf8)
    $changed++
  }
}
Write-Host "Files changed: $changed"
