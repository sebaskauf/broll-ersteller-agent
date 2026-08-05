---
name: hyperframes-local-fonts
description: HyperFrames-Renders dürfen NICHT auf Google-Fonts-@import bauen — woff2 lokal capturen, sonst Tofu/Fallback-Flash im Render
metadata:
  type: reference
---

# HyperFrames: Fonts immer lokal capturen, nie Google-Fonts-@import

Bei HyperFrames-B-Rolls (`npx hyperframes render`) schlägt der externe Font-Request im sandboxed Render fehl → Fallback-Font / Tofu-Boxen im finalen MP4. `npx hyperframes lint` warnt explizit: `google_fonts_import` + `font_family_without_font_face`.

**Why:** Der Capture-Browser läuft offline/sandboxed; `@import url(fonts.googleapis.com…)` lädt nicht rechtzeitig (oder gar nicht). Web-Preview sieht okay aus, Render hat falsche Typo.

**How to apply — Capture-Rezept (funktioniert, getestet 03.06.):**
1. Google-Fonts-CSS mit Browser-UA ziehen: `curl -A "<chrome UA>" "https://fonts.googleapis.com/css2?family=…&display=swap" -o gf.css`
2. NUR den `latin`-Subset rausfiltern (nicht latin-ext/cyrillic). Der latin-Subset enthält ä ö ü ß (U+00C0-00FF). Mit python die `/* latin */`-Blöcke parsen.
3. woff2-URLs runterladen nach `assets/fonts/f0.woff2` … (Google serviert variable Fonts: mehrere weights teilen 1 File — `font-weight: 400 700` Range im @font-face).
4. Im HTML `@import` ersetzen durch lokale `@font-face { … src: url("assets/fonts/fN.woff2") format("woff2"); font-display: block; }`. `font-display: block` damit kein FOUT.
5. Verifizieren: `head -c 4 file.woff2` muss `wOF2` zeigen; mit fontTools `getBestCmap()` prüfen dass 0xE4/0xF6/0xFC/0xDF (ä ö ü ß) drin sind.
6. Georgia/system-Fallbacks aus `font-family` raus (sonst `font_family_without_font_face`-Warnung) — nur generisches `serif`/`monospace` lassen.

Ziel: `npx hyperframes lint` = 0 errors, 0 warnings UND `inspect` = 0 layout issues VOR Render.

Verwandt: [[workflow_broll_creation]]
