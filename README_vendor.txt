Hakuoh Transport Simulator - CDN-free (vendor) build

1) Run vendor download (Windows PowerShell)
   - Right click this folder -> "Open in Terminal" (PowerShell)
   - Run:
       .\download_vendor.ps1

2) Local test
   - Double click index.html (recommended: Chrome)
   - Load a PNG/PDF floorplan from your PC.

3) Netlify deploy
   - Upload these items at the SITE ROOT:
       index.html
       StampAssets/   (folder)
       vendor/        (folder)
       (optional) README_vendor.txt, download_vendor.ps1
   - Folder name doesn't matter.

Notes
- This build does NOT load any CDN scripts.
- If file loading still fails, open Chrome DevTools -> Console and share the first error line.
