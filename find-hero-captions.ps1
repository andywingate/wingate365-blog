$posts = Get-ChildItem "c:\git\wingate365-blog\content\posts\*.md"
$rx = '(?s)^\s*<table[^>]*class="tr-caption-container"[^>]*>\s*<tbody>\s*<tr>\s*<td[^>]*>\s*</td>\s*</tr>\s*<tr>\s*<td class="tr-caption"[^>]*>(.*?)</td>\s*</tr>\s*</tbody>\s*</table>'
foreach ($p in $posts) {
    $raw = Get-Content $p.FullName -Raw
    if ($raw -match '(?s)^(---\r?\n.*?\r?\n---\r?\n)(.*)$') {
        $body = $matches[2]
        if ($body -match $rx) {
            $cap = $matches[1].Trim()
            Write-Host "MATCH: $($p.Name) => [$cap]"
        }
    }
}
