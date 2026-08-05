---
name: hyperframes-embed-user-media
description: Sebastians eigene Higgsfield-Videos/Bilder in HyperFrames-B-Rolls einbetten (Scroll-Animation-Set 17.07., render-verifiziert)
metadata:
  type: reference
---

# Eigene Video-/Bild-Assets in HyperFrames einbetten

Neuer Beat-Typ (Tag Scroll-Animation, 17.07.2026): Sebastian generiert selbst Assets in Higgsfield (Start-/Endframes, Verbindungs-Videos, Screen-Recordings, Apple-Clips) und will sie in unsere Stil-DNA-Beats eingebettet — nicht nur Text/Metaphern. **Render-verifiziert, funktioniert einwandfrei.**

## Ablauf
1. **Assets holen + verstehen**: Kopieren nach `<set>/clips/`, `ffprobe` (Dauer/Dimensionen/Codec), Kontaktblätter mit `ffmpeg tile` bauen + mit Read anschauen (Trim-Punkte, Crop-Region bestimmen). Higgsfield-Prompts via `mcp Higgsfield show_generations` auslesen (zum "allgemeinisieren" für Notiz-App-Screenshots) — KEINE neuen Generierungen (spart Credits).
2. **Clips auf EXAKT 5.0s vorbacken** (ffmpeg, render-sicher = `yuv420p`, `+faststart`, `-r 30`):
   - zu kurz → letztes Frame einfrieren: `tpad=stop_mode=clone:stop_duration=X`
   - zu lang → `-ss`/`-t` Fenster, oder statischen Vorlauf abschneiden + `setpts=faktor*PTS` auf 5s strecken
   - Portrait-Recording mit Desktop-Site drin → `crop=` tight auf die Browser-Karte, dann `scale` hoch
   - Vorbacken > `data-media-start`-Trickserei (weniger Render-Risiko).
3. **Einbetten**: `<video id=".." data-start="0" data-duration="5" data-track-index="0" src="assets/x.mp4" muted playsinline>` in einem **nicht-getimten** Wrapper-Div (`.screen`, `overflow:hidden`, rounded). Video via `width/height:100%; object-fit:cover|contain`. NUR den Wrapper animieren, nie das Video-Element. Bilder analog als `<img object-fit:cover>`.
   - dunkler Clip (Apple near-black) → `object-fit:contain` auf `#000`-Screen = nahtloser Pillarbox.
4. **Framing im SKAILE-Stil**: Video-Player-Card (dunkle Controls + coral Play-Dreieck + Progressbar `scaleX` synchron), Browser-Chrome (Traffic-Lights + Adressleiste mit gezeichnetem Schloss), gezeichneter Maus-Scroll-Indikator (rounded-rect + Rad-Dot yoyo), bewegender Scrollbar-Thumb. Alles gezeichnet, keine Emojis.

## Notiz-App-Prompt-Screenshot (Beat-Typ "der Prompt tippt sich runter")
White Card + Traffic-Lights + "Notizen"-Titel; Body = `<span id=ptxt>` (mono, `white-space:pre-wrap`) + inline `<span class=crt>` Caret. Typewriter: Proxy `{i:0}` → `ease:'steps('+txt.length+')'`, `onUpdate` setzt `textContent=txt.slice(0,i)`. Caret blinkt mit finiten yoyo-repeats, endet vor Ausblenden (Falle 5/10). Prompt aus Higgsfield allgemeinisieren, deutsch, echte Umlaute.

## Fallen
- **StaticGuard-Inspect-Meldung** "`<video> uses data-end without data-duration`" trotz korrektem `data-duration` = **False-Positive** (Inspect normalisiert intern zu data-end). Lint bleibt 0/0, Render zeigt Video korrekt. Ignorieren — der Render + Kontaktblatt ist der echte Beweis.
- Immer erst EINEN Video-Beat als Spike rendern + Frames anschauen, bevor man 5 weitere baut.
- `hyperframes render` meldet `hasAudio:false` (wir strippen Audio mit `-an` beim Vorbacken; SFX separat nach Bedarf).
- ⚠️ **`data-start + data-duration` MUSS bis zum Comp-Ende reichen** (Tag 170, 24.07.): endet das Video-Zeitfenster VOR den vollen 5.0s (z.B. `data-start="0.9" data-duration="3.5"` = Ende bei 4.4s), springt der Screen danach auf leer zurück (Hintergrundfarbe der Wrapper-Div) statt den letzten Frame zu halten — hässlicher "Reset" in den letzten Frames. Fix: `data-start` so setzen, dass `start + duration ≈ 5.0`. Ablauf: 1) Ziel-Fenster festlegen (Entrance braucht meist bis ~0.6-0.9s, Video-Fenster = Rest bis 5.0), 2) Speedfaktor = Rohlänge/Zielfenster, 3) backen, 4) tatsächliche Ausgabe-Dauer per `ffprobe` prüfen (30fps rundet, Ziel wird meist um ±0.2-0.3s verfehlt), 5) `data-start = 5.0 - tatsächliche_Dauer` ERST NACH dem Backen final setzen. IMMER auch den LETZTEN Frame (z.B. n=149 bei 150 Frames) im Augencheck prüfen, nicht nur Mid-Frames — genau da zeigt sich dieser Bug.
- Speed-Faktor fürs Vorbacken: `setpts=PTS/K` bei K>1 beschleunigt (K=4 → 4x schneller). Rohes Screen-Recording vorher per Kontaktblatt sichten und so weit VOR dem Ende trimmen (`-t`), dass keine Fade-outs/Schwarzbilder mit reinrutschen.

Beispiel-Set: `~/Documents/Projects/scroll-animation-broll/` (6 Beats: Notiz-Prompt+Start/End-Bild · zwei Bilder→Video-Player · Verbindungs-Prompt+Video · Video→Einzelbild-Grid · Website im Browser · Apple-Teardown im Browser). Zweites Beispiel: `tag170-claude-design-plugins-broll/02-apple-scroll-animation` (echtes 14s-Screen-Recording auf 3.2x Speed gebacken, Browser+Scrollbar-Struktur aus `scroll-animation-broll/05-website-scroll` übernommen).
