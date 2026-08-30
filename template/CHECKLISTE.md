# B-Roll-Set — Ablauf-Checkliste (pro Set einmal durchgehen)

Diese Liste ist verbindlich. Reihenfolge einhalten, nichts überspringen.
Das Master-Template liegt in `_TEMPLATE/` — IMMER kopieren, nie von Null bauen.

## 0. Stil laden
- [ ] `stil.md` (in diesem Ordner) lesen — Farben, Stimmung, Format, No-Gos des Nutzers
- [ ] Fehlt die `stil.md` → STOP, erst das Setup-Interview aus dem Agent fahren (keine B-Rolls ohne Stil)
- [ ] Template-Farben beim Bauen durch die stil.md-Werte ersetzen (außer stil.md sagt "Beispiel-Stil übernehmen")

## 1. Teile mappen
- [ ] Genannte Teile nummeriert rausschreiben: Teil N = Comp N (exakt, nicht mehr, nicht weniger)
- [ ] Nur die GENANNTEN Teile bauen — restliches Skript ist nur Kontext
- [ ] Hook/CTA/Keyword NIE dazuerfinden. Sagt er "ohne das Keyword" → Beat ohne Keyword bauen
- [ ] Whisper-Fixes anwenden (Glossar im Agent-Prompt: Claude, CLAUDE.md, Anthropic, Fable 5, Higgsfield, GPT-5.6 Sol …)
- [ ] Pro Teil EINE Metapher notieren (Tabelle: Teil → Metapher → Ordnername)

## 2. Recherche (nur wenn reale Tools/Repos/Modelle vorkommen)
- [ ] Echte Daten per WebSearch/WebFetch holen (Stars, Preise, Commands, Datum)
- [ ] Logos per curl von Wikimedia Commons (mit User-Agent), als Inline-SVG-Path einbetten
- [ ] KEINE Zahlen erfinden. Keine echte Zahl gefunden → Visual ohne Zahl bauen

## 3. Scaffold
- [ ] Projektordner `~/Documents/Projects/tagNNN-<topic>-broll/`
- [ ] Pro Beat: `_TEMPLATE/` kopieren nach `NN-<slug>/` (Fonts kommen automatisch mit)

## 4. Bauen (pro Beat)
- [ ] EINE Metapher, die sich über die vollen 5s erzählt (nicht 3 statische Karten)
- [ ] Kicker-Text + Bottom-Pill-Text konkret auf den gesprochenen Satz
- [ ] Nur gezeichnete SVG/CSS-Visuals — NIEMALS Emoji-Glyphen (auch nicht ⚠ ✓ als Symbol-Font)
- [ ] Alle technischen Fallen aus dem Agent-Prompt beachten (Nadel=HTML-div, scaleX braucht width, …)

## 5. QA-Gate (Pflicht, EIN Durchgang)
- [ ] `npx --yes hyperframes lint <dir>` → 0 errors / 0 warnings
- [ ] `npx --yes hyperframes inspect <dir>` → 0 errors / 0 warnings (Infos ok)
- [ ] Gewollte Effekte markieren statt wegbauen: `data-layout-allow-overlap` / `-overflow` / `-occlusion`
- [ ] Checks pro Ordner EINZELN laufen lassen (Batch-Loops verschlucken Output)

## 6. Render + Augencheck
- [ ] `npx --yes hyperframes render <dir> --quality high --output out/tagNNN-<slug>.mp4`
- [ ] Kontaktblatt: `ffmpeg -i out/X.mp4 -vf "select='eq(n\,145)',scale=600:-1" -frames:v 1 .qa/X.png`, alle stacken
- [ ] Kontaktblatt mit Read ANSCHAUEN. Kaputt/leer/abgeschnitten → fixen → neu rendern
- [ ] Typischer End-Frame-Check: letzter Frame darf nie leer sein, Badges nicht geclippt, Balken gefüllt

## 7. Abschluss
- [ ] `.qa/` löschen, `open out/`
- [ ] Report-Tabelle: # | Teil (Zitat) | Metapher | Datei
- [ ] Bei Iterationen: NIE gerenderte Comps überschreiben → `-v2`-Ordner/Namen

## SFX (nur wenn der User Sound will)
- [ ] ffmpeg-lavfi-Synthese (sine/anoisesrc/aevalsrc), Rezepte im Agent-Memory `reference_ffmpeg_sfx_synth`
- [ ] `sfx.wav` in Comp-Ordner + `<audio data-start="<payoff>" data-track-index="1">` ins root-div
- [ ] Verifizieren: Render meldet hasAudio:true, ffprobe zeigt video+audio
