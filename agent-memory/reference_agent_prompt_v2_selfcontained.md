---
name: agent-prompt-v2-selfcontained
description: Agent-Prompt am 13.07.2026 komplett neu geschrieben (selbsttragend fuer schwaechere Modelle) + Template-Kit auf Disk — was wo liegt und warum
metadata:
  type: reference
---

# Agent-Prompt V2 (13.07.2026): selbsttragend + Template-Kit

Sebastian wollte explizit, dass der Agent-System-Prompt so optimiert wird, dass ein **schwächeres Modell ohne Gesprächskontext** genauso vorgeht und gleiche Qualität liefert ("System optimieren"-Play aus seinem eigenen Fable-5-Video).

## Was gebaut wurde
1. **`~/.claude/agents/broll-ersteller.md` komplett neu** — HyperFrames als Standard-Pipeline (Remotion nur auf explizite Anfrage). Alles inline statt nur verlinkt: deterministischer 8-Schritte-Ablauf, Whisper-Glossar-Tabelle, komplette Stil-DNA (Hex-Farben, Typo, Pixel-Anatomie, Motion-Dramaturgie), Metaphern-Katalog, harte Verbote, 10 technische Fallen (jede hatte real einen Render gekostet), SFX-Rezept-Verweis, QA-Gate + Pflicht-Augencheck via Kontaktblatt+Read.
2. **Template-Kit `~/Documents/Projects/broll-set-template/`**:
   - `_TEMPLATE/index.html` — lint-sauberes Master-Boilerplate (Fonts, tex-Squiggle, Kicker, Foot-Pill, GSAP-Gerüst) mit Fallen-Kommentaren direkt im Code. Verifiziert: lint 0/0, inspect 0, Smoke-Render ok.
   - `_TEMPLATE/assets/fonts/` — f0-f3.woff2 (Inter/JetBrains Mono/Newsreader) reisen beim Kopieren automatisch mit.
   - `CHECKLISTE.md` — abhakbarer Set-Ablauf für schwache Modelle.
   - Scaffold-Idiom: `cp -R _TEMPLATE $BASE/NN-slug` (ersetzt mkdir+Font-Kopieren).

## Prinzip dahinter (für künftige Prompt-Pflege)
- Schwache Modelle brauchen **kopierbare Artefakte + Tabellen**, nicht Prinzipien: Template kopieren schlägt Template erinnern.
- Jede real gekostete Iteration wird zur nummerierten Falle im Prompt (Self-Improvement-Loop). Neuer wiederholter Fehler → neue Zeile in der Fallen-Liste des Agent-Files, nicht nur ins Memory.
- Whisper-Glossar gehört in den Prompt (Diktat-Fehler wie Dropback/CloudMD/Soul tauchen in JEDEM Skript auf).
- Linter-Detail: auch AUSKOMMENTIERTE `<audio src=...>`-Tags werden geprüft → Beispiel-Snippets im Template als Prosa schreiben, nicht als Tag-Syntax.

## Validierung (13.07.2026, Tag 159)
V2-Prompt live getestet: als **Opus 4.8** (nicht Fable 5) ein 16-Comp-Set "Fable 5 richtig nutzen" gebaut — end-to-end aus Template-Kit, exaktes 16-Teil-Mapping, Stil konsistent. **Sebastian-Urteil: "brole ist wirklich perfekt" (13.07.).** Also nicht nur Selbsteinschätzung — der schwache-Modell-Output wurde vom User explizit als perfekt bestätigt. Nur Mini-Lint-Fixes nötig, die 2 neue Fallen ins Agent-File brachten (jetzt #11 fehlendes Newsreader-`@font-face` beim Von-Hand-Schreiben, #12 CSS-transform-vs-GSAP-scale-Konflikt). Lehre HART bestätigt: schwaches Modell + kopierbares Template + Fallen-Liste = perfekte Qualität. Nicht am selbsttragenden Setup rütteln; neue Falle → sofort nummeriert ins Agent-File.

Verwandt: [[hyperframes-multi-comp-batch]], [[hyperframes-replicas-and-sfx]], [[light-backgrounds-only]], [[ffmpeg-sfx-synth]]
