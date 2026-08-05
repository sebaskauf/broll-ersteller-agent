---
name: workflow-motion-graphic-overlays-on-talkinghead
description: Workflow um Anthropic-Editorial Motion-Graphic-Einblendungen NEBEN dem Sprecher in ein fertig geschnittenes Talking-Head-Video zu legen (nicht Standalone-B-Roll). HTML-Overlay -> Playwright PNG-Seq -> ffmpeg composite.
metadata:
  type: feedback
---

Andere Aufgabenklasse als die üblichen Standalone-Remotion-B-Rolls: Hier werden Grafiken als transparente Overlays SEITLICH neben den mittig sitzenden Sprecher auf ein bereits geschnittenes Video (mit Ton, mit eigener B-Roll) gelegt, synchron zur Sprache, nur an Talking-Head-Stellen.

**Why:** Sebastian schneidet final in CapCut, das Video hat schon B-Roll. Overlays dürfen nicht übers Gesicht und nicht über vorhandene B-Roll. 4K/60fps Vollrender ist teuer -> erst Sample bauen, Look bestätigen lassen, dann Rest.

**How to apply:**
1. `face_scan.json` ist die Wahrheit: pro Region `kind: talk|broll` + `cx` (Gesicht-Center-X). Nur in `talk`-Regionen einblenden. Sprecher sitzt meist cx~0.50 -> Overlay in linkes Band (x .03-.31) ODER rechtes Band (x .64-.96), Seiten abwechseln. Gesicht/Oberkörper-Zone y .10-.62 freihalten.
2. Pro Beat per Frame verifizieren (`ffmpeg -ss <t> -i src -frames:v 1`), dass dort wirklich Gesicht sichtbar ist (kein B-Roll) und welche Seite frei/ruhig ist.
3. Wort-Timings aus `words_aai.json` (Felder: text/start/end in Sekunden) -> Einblendung exakt zur passenden Phrase timen.
4. Overlay-Technik (effizient, kein 4K-Re-Render): seek-driven HTML mit `window.__seek(t_seconds)` + transparentem BG -> Python-Playwright rendert PNG-Sequenz (30fps reicht für Overlay-Motion) mit `omit_background=True` bei 1920x1080 -> ffmpeg `overlay` auf den (fuer Sample auf 1080p skalierten) Clip-Ausschnitt, Overlay-Start via `setpts=PTS-STARTPTS+<offset>/TB`, `eof_action=pass`.
5. Audio des Original-Clips mitnehmen (`-map 0:a`).

**Style (Sebastians explizite Korrekturen ggü. grau/fett/vorm-Gesicht):** warm Cream #FAFAF7-Halo statt Box, Anthropic-Coral fuer Akzente aber dunkler-getoent (#B5613F) damit er auf heller Wand Kontrast hat, leichte Newsreader-Serif (font-weight 330-360, NICHT bold), underlined accents (coral border) statt Kaesten, viel Whitespace. Auf hellem Hintergrund: dunkler Text + Cream-text-shadow-Halo. Ueber ausgebranntem Fenster: zusaetzlich ein gefeatherter radialer Cream-Wash (kein harter Rand) als Lesbarkeits-Hilfe. Abwechslung: mal grosse Serif-Stat (10x), mal Titel mit Eyebrow+underline.

**Platzierung "mehr in den Raum" (bestaetigt 2x):** Overlays NICHT an den Bildrand kleben, sondern Richtung Mitte ruecken bis knapp vor seinen Koerper -> wirkt als stuenden sie mit ihm im Raum. Konkret bei cx~0.50: stage links `left:215px`, rechts `right:120px` (NICHT 230, das ist zu weit drin/ueberlappt Kopf bei langen Woertern). Bei rechten Beats mit langer Headline (z.B. "Claude-Mitgliedschaft"): H1 ~52px + width begrenzen, sonst laeuft Text in seinen Kopf.

**Kreativerer Anfang (Sebastian-Wunsch, bestaetigt):** Im Intro-Bereich (0:00-1:10) echte Animationen statt statischer Cards: (a) Intro-Titel kinetisch Wort-fuer-Wort rein mit back-ease + blinkender Terminal-Caret + draw-on underline. (b) "Geraete" (Mac/Windows/Linux): 3 clean inline-SVG-Icons nacheinander mit spring-pop reinanimiert (eob ease), coral Trennlinie scaleX, dann Callout "Fast identisch, ein Befehl pro System" + Mono-Command-Andeutung. (c) claude.ai char-by-char getippt mit Caret. Bleibt clean Claude-Look, kein Kitsch/Glitzer. Erste 11min Render-Wert war es Sebastian wert.

**Projekt:** `~/Documents/Projects/katchup-lead-automation/video-editor/claudestyle/` — `overlays/*.html`, `render_overlay.py`, venv eine Ebene hoeher unter `video-editor/.venv`. Tokens aus skaile-editorial-html design-system.md.

**Gotcha:** Python-Playwright braucht eigene Chromium-Install (`python -m playwright install chromium`). System-Fonts Iowan Old Style / Charter / Georgia sind lokal da als Newsreader-Fallback; Newsreader selbst laedt via Google Fonts (Chromium hat Netz) -> `document.fonts.ready` + ~600ms warten vor erstem Frame.

**Bestaetigte Batch-Pipeline (launch2, Juni 2026 — Launch-Video 4K/60 HEVC 685s):** Reusable Scaffold liegt unter `video-editor/batch/<id>/`. `scripts/gen_alpha.py` + `scripts/render_beat_alpha.py` sind die generische Variante; fuer ein neues Video reicht ein `render_overlays.py` mit BEATS=[(name,html,start,dur)] + `splice.sh`. Render-Route: transparente PNG-Seq (1920x1080, omit_background, 30fps) NUR an Beat-Zeiten -> `splice.sh` skaliert Original auf 1080p (`scale=1920:1080,setsar=1[base]`), kettet pro Overlay `[i]setpts=PTS-STARTPTS+start/TB` dann `overlay=0:0:format=yuv420:enable='between(t,start,end)'`, `-c:v hevc_videotoolbox -b:v 12M` (1080p Review) + `-c:a copy`. 13 Beats composite in ~3 Min auf 1080p. Output `work/<id>/<id>_grafiken_1080p.mp4`.

**HELLER Look ist Sebastians Praeferenz (KORREKTUR Juni 2026 v2, ueberschreibt die fruehere dunkel-Scrim-Loesung komplett):** Sebastian fand dunkel-warmer Scrim hinterm Glas "haesslich braun / zu dunkel / zu schwer". RICHTIG ist DUNKLER TEXT AUF HELLEM frostigem Glas, NICHT heller Text auf dunklem Scrim. Was funktioniert (v2, bestaetigt): (a) `.glass` = frostiges cremeweiss bis fast-weiss, linear-gradient rgba(252,250,247,0.80)->rgba(248,243,236,0.70), backdrop blur(30) saturate(135%) brightness(1.06). (b) `.scrim` fast WEG — nur ganz subtil rgba(255,255,255,~0.10) fuer Tiefe, KEIN brauner/dunkler Tint. (c) Text dunkel: Headlines/Zahlen in Clay-Coral #9C4F30 (coral-deep) als Akzent, Fliesstext/labels in --ink #1A1A1A / --ink-muted. (d) Clay-Coral NUR als Akzent (Haekchen, Unterstriche, Zahlen-Highlight, eyebrow), NICHT als Flaechentoenung der Karte. (e) Karten vorm ausgebrannt-hellen Fenster: `.glass.strong` = Glas eine Spur dichter/weisser (rgba ~0.85) + brightness 1.08, Text bleibt DUNKEL (ink). Dunkler Text auf hellem Glas ist auf der hellen Dachschraege gut lesbar — DAS war die fehlende Einsicht (vorher faelschlich dunklen Scrim gebaut). Per-Frame-Sample VOR dem Vollcomposite bleibt Pflicht (Preise zuerst, Kernmoment).

**Lokale Fonts statt Google-CDN (vermeidet Tofu/Fallback-Flash im sandboxed Render):** woff2 liegen in `video-editor/fonts/` (newsreader.woff2, newsreader-italic.woff2, jetbrainsmono.woff2). In `overlays/` kopieren + eigenes `_fonts.css` mit `@font-face ... font-display:block; src:url(newsreader.woff2)`. NICHT auf gstatic-Links verlassen (nr.css/jb.css im fonts/-Ordner zeigen noch auf CDN — die NICHT nehmen).

**Zentrale Karten (Intro/Brand/Outro) bei mittigem Sprecher:** gehen, wenn Karte hoch genug oben sitzt (top ~96-188px) und kompakt (width <=950). Die halbtransparente Glas-Oberkante darf ueber die Haare laufen (Haare scheinen durch = elegant), aber der TEXT muss klar ueber Stirn/Gesicht bleiben.
