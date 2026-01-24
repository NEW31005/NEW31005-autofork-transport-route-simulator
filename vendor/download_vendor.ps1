# Vendor downloader for Hakuou Transport Simulator
# Run this in the folder where index.html exists.
# It will download required JS libraries into .\vendor\

$ErrorActionPreference = 'Stop'

# Ensure TLS 1.2+
try {
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13
} catch {
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
}

$vendorDir = Join-Path $PSScriptRoot '.'
New-Item -ItemType Directory -Force -Path $vendorDir | Out-Null

$files = @(
  @{ url = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js';        out = 'pdf.min.js' },
  @{ url = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js'; out = 'pdf.worker.min.js' },
  @{ url = 'https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js'; out = 'html2canvas.min.js' },
  @{ url = 'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js';     out = 'jspdf.umd.min.js' }
)

foreach ($f in $files) {
  $outPath = Join-Path $vendorDir $f.out
  Write-Host "Downloading $($f.out) ..." -ForegroundColor Cyan
  Invoke-WebRequest -Uri $f.url -OutFile $outPath -UseBasicParsing
}

Write-Host "\nDone. vendor files:" -ForegroundColor Green
Get-ChildItem $vendorDir | Select-Object Name, Length
