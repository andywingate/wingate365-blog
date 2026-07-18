<#
.SYNOPSIS
  Generate an on-brand Wingate365 hero image (SVG) for a blog post.

.DESCRIPTION
  Produces a branded 1200x630 hero SVG under static/images/heroes/ following the
  Wingate365 hero style guide (see static/brand-guide.html, section "Hero images").

  The hero is logo-led: the brand marks are the hero, not text. Two layouts,
  chosen automatically from the number of icons supplied:
    * One icon  -> a single centred logo (Andy's go-to logo hero).
    * Two icons -> "logo A -> logo B", the migration / comparison layout.

  Brand marks are pulled from Simple Icons (CC0) at generation time and embedded
  into the SVG, so the finished file is self-contained with no external requests.

.PARAMETER Slug
  Output filename (without extension). Also used as the gradient/id seed.

.PARAMETER Icon
  One or two Simple Icons slugs, e.g. "blogger","github". Find slugs at
  https://simple-icons.org (the slug is the lowercase, space-free brand name).

.PARAMETER Theme
  "dark" (default) - the bold BC gradient with the logos on white chips.
  "light" - clean near-white background, ink logos, one Azure accent.

.PARAMETER Palette
  Dark-theme background palette, drawn from the brand guide gradient pairs:
  two-stop  - azure, steel, forest, ink, burgundy
  three-stop - blue (default), aurora, teal, dusk
  Ignored when -Theme light.

.PARAMETER Title
  Optional headline under the logos. Off by default - heroes are logo-led, keep
  text out unless a post genuinely needs it.

.PARAMETER Label
  Optional small eyebrow label above the logos. Off by default.

.EXAMPLE
  ./new-hero.ps1 -Slug blogger-to-github -Icon blogger,github

.EXAMPLE
  ./new-hero.ps1 -Slug power-automate-tips -Icon microsoftpowerautomate

.EXAMPLE
  ./new-hero.ps1 -Slug launch-day -Icon github -Theme dark
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory)] [string]   $Slug,
  [Parameter(Mandatory)] [string[]] $Icon,
  [ValidateSet('light','dark')] [string] $Theme = 'dark',
  [ValidateSet('blue','azure','steel','forest','ink','burgundy','aurora','teal','dusk')] [string] $Palette = 'blue',
  [string] $Title = "",
  [string] $Label = ""
)

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

if ($Icon.Count -lt 1 -or $Icon.Count -gt 2) {
  throw "Supply one or two icon slugs (got $($Icon.Count))."
}

# --- Brand palette (see brand-guide.html) --------------------------------
$INK    = '#0F1E2A'   # Deep Ink   - logo colour, gradient start (dark theme)
$AZURE  = '#0B71C7'   # BC Azure   - the single brand accent (connector arrow)
$CYAN   = '#37BEF3'   # BC Cyan    - gradient end / connector on dark theme
$PAPER  = '#FFFFFF'
$MIST   = '#F4F7FA'

# --- Fetch each Simple Icons path (CC0) ----------------------------------
function Get-IconPath([string]$slug) {
  $url = "https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/$slug.svg"
  try {
    $svg = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content
  } catch {
    throw "Could not fetch icon '$slug' from Simple Icons. Check the slug at https://simple-icons.org"
  }
  if ($svg -notmatch 'd="([^"]+)"') { throw "No path found in icon '$slug'." }
  return $Matches[1]
}

$paths = @($Icon | ForEach-Object { Get-IconPath $_ })

# --- Theme values --------------------------------------------------------
$dark = ($Theme -eq 'dark')

# Dark-theme background palettes (brand guide gradient pairs). Each is a list of
# gradient stops plus the connector-arrow colour that reads on it.
$palettes = @{
  blue     = @{ stops = @('#0F1E2A','#0B71C7','#37BEF3'); arrow = $CYAN }
  azure    = @{ stops = @('#0B71C7','#37BEF3');           arrow = '#ffffff' }
  steel    = @{ stops = @('#3D6B8F','#5B5EA6');           arrow = '#ffffff' }
  forest   = @{ stops = @('#2E7D5A','#6A8A7E');           arrow = '#ffffff' }
  ink      = @{ stops = @('#0F1E2A','#3D6B8F');           arrow = '#6FB0D4' }
  burgundy = @{ stops = @('#8B2E52','#5B5EA6');           arrow = '#ffffff' }
  aurora   = @{ stops = @('#0F1E2A','#5B5EA6','#37BEF3'); arrow = $CYAN }
  teal     = @{ stops = @('#0F1E2A','#3D6B8F','#2E7D5A'); arrow = '#94EFFF' }
  dusk     = @{ stops = @('#0F1E2A','#8B2E52','#C77D1A'); arrow = '#ffffff' }
}
$pal = $palettes[$Palette]

$arrowCol = if ($dark) { $pal.arrow } else { $AZURE }
$titleCol = if ($dark) { '#ffffff' } else { $INK }
$labelCol = if ($dark) { $CYAN } else { $AZURE }
$markCol  = if ($dark) { '#ffffff' } else { $INK }
$markOp   = if ($dark) { '0.14' } else { '0.16' }
$blobCol  = if ($dark) { '#ffffff' } else { $INK }
$blobOp   = if ($dark) { '0.05' } else { '0.035' }

# --- Canvas / layout constants -------------------------------------------
$W = 1200; $H = 630
$logoSize = 220; $chip = 268; $radius = 44
$cy = if ($Title) { 278 } else { 315 }

# Draw a logo. On dark theme it sits on a white rounded chip; on light theme the
# ink mark sits straight on the near-white background.
function New-Logo([double]$centreX, [double]$centreY, [string]$pathData) {
  $s = $logoSize / 24.0
  $tx = $centreX - ($logoSize / 2.0)
  $ty = $centreY - ($logoSize / 2.0)
  if ($dark) {
    $cs = $chip / 2.0
    $off = ($chip - $logoSize) / 2.0
    $ctx = $centreX - $cs + $off
    $cty = $centreY - $cs + $off
    return @"
  <rect x="$($centreX-$cs)" y="$($centreY-$cs)" width="$chip" height="$chip" rx="$radius" fill="#ffffff"/>
  <g transform="translate($ctx,$cty) scale($s)"><path d="$pathData" fill="$INK"/></g>
"@
  }
  return @"
  <g transform="translate($tx,$ty) scale($s)"><path d="$pathData" fill="$INK"/></g>
"@
}

$content = New-Object System.Text.StringBuilder

if ($paths.Count -eq 1) {
  [void]$content.Append((New-Logo ($W/2) $cy $paths[0]))
} else {
  $x1 = 420; $x2 = 780
  [void]$content.Append((New-Logo $x1 $cy $paths[0]))
  [void]$content.Append((New-Logo $x2 $cy $paths[1]))
  # Connector arrow - the single brand accent.
  $ax = ($x1 + $x2) / 2
  [void]$content.Append(@"
  <g stroke="$arrowCol" stroke-width="7" stroke-linecap="round">
    <line x1="$($ax-30)" y1="$cy" x2="$($ax+16)" y2="$cy"/>
  </g>
  <path d="M $($ax+12) $($cy-16) L $($ax+38) $cy L $($ax+12) $($cy+16) Z" fill="$arrowCol"/>
"@)
}

# Optional eyebrow label above the logos (off by default).
if ($Label) {
  $lbl = [System.Security.SecurityElement]::Escape($Label.ToUpper())
  [void]$content.Append(@"
  <text x="$($W/2)" y="$($cy-150)" text-anchor="middle" font-family="Figtree, -apple-system, Segoe UI, Roboto, sans-serif" font-size="26" font-weight="700" letter-spacing="4" fill="$labelCol" opacity="0.9">$lbl</text>
"@)
}

# Optional headline under the logos (off by default).
if ($Title) {
  $ttl = [System.Security.SecurityElement]::Escape($Title)
  [void]$content.Append(@"
  <text x="$($W/2)" y="486" text-anchor="middle" font-family="Figtree, -apple-system, Segoe UI, Roboto, sans-serif" font-size="56" font-weight="800" letter-spacing="-1" fill="$titleCol">$ttl</text>
"@)
}

$seed = ($Slug -replace '[^a-zA-Z0-9]', '')

if ($dark) {
  $stops = $pal.stops
  $sb = New-Object System.Text.StringBuilder
  [void]$sb.AppendLine("    <linearGradient id=`"bg-$seed`" x1=`"0`" y1=`"0`" x2=`"1`" y2=`"1`">")
  for ($i = 0; $i -lt $stops.Count; $i++) {
    $offset = if ($stops.Count -eq 1) { 0 } else { [math]::Round($i / ($stops.Count - 1), 2) }
    [void]$sb.AppendLine("      <stop offset=`"$offset`" stop-color=`"$($stops[$i])`"/>")
  }
  [void]$sb.Append("    </linearGradient>")
  $bg = $sb.ToString()
} else {
  $bg = @"
    <linearGradient id="bg-$seed" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="$PAPER"/>
      <stop offset="1" stop-color="$MIST"/>
    </linearGradient>
"@
}

$svg = @"
<svg viewBox="0 0 $W $H" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="$([System.Security.SecurityElement]::Escape($(if($Title){$Title}else{$Slug})))">
  <defs>
$bg
  </defs>
  <rect width="$W" height="$H" fill="url(#bg-$seed)"/>
  <circle cx="1075" cy="95" r="240" fill="$blobCol" opacity="$blobOp"/>
  <circle cx="150" cy="555" r="180" fill="$blobCol" opacity="$blobOp"/>
$($content.ToString())
  <text x="$($W-60)" y="$($H-46)" text-anchor="end" font-family="Figtree, -apple-system, Segoe UI, Roboto, sans-serif" font-size="20" font-weight="700" letter-spacing="3" fill="$markCol" opacity="$markOp">WINGATE365</text>
</svg>
"@

$root    = Split-Path -Parent $PSScriptRoot
$destDir = Join-Path $root 'static/images/heroes'
if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir | Out-Null }
$dest = Join-Path $destDir "$Slug.svg"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($dest, $svg, $utf8NoBom)

Write-Host "Hero written: static/images/heroes/$Slug.svg" -ForegroundColor Green
Write-Host "Set in front matter:  hero: `"/images/heroes/$Slug.svg`"" -ForegroundColor Cyan
