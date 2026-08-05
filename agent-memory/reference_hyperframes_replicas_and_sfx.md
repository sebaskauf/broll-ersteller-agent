---
name: hyperframes-replicas-and-sfx
description: Detailgetreue App-/Repo-Replica-Beats + baked SFX in HyperFrames (Tag 155) — plus zwei harte Render-Lektionen (SVG-Nadel, scaleX-fill)
metadata:
  type: reference
---

# HyperFrames: Detailgetreue Replicas, baked SFX, Render-Fallen (Tag 155)

Tag 155 (Humanizer-Skill-Video, `~/Documents/Projects/tag155-humanizer-broll/`): 7 Einzel-5s-Comps, Lint+Inspect 0/0, mit synchronem Ton gerendert. Sebastian wollte "so detailgetreu wie möglich wie eine echte App aussehen lassen" (AI-Detektor-App) + "vielleicht Soundeffekt an passenden Stellen".

## Detailgetreue App-/Repo-Replica als Beat-Typ (explizit gewünscht)
Wenn Sebastian sagt "detailgetreu wie eine echte App/Tool nachstellen" → **echte UI 1:1 nachbauen, aber in unserem Stil** (heller BG, Coral-Akzent, Mono-Labels):
- **AI-Detektor-App** (GPTZero/ZeroGPT-Look): Browser-Window (Traffic-Lights + Adressleiste mit Lock) → links Text-Panel dessen Sätze beim Scan grün highlighten (Scan-Beam sweept runter), rechts Result-Panel mit Ring-Gauge (AI-% zählt runter 92→0 via Proxy+onUpdate), Verdict-Pill "Human-written" + Confidence-Bars (Human/AI/Mixed). Das war das gefeierte Herzstück.
- **GitHub-Repo** (dark card #0D1117 auf hellem BG = ok): "owner / repo" + Public-Pill + Watch/Fork/Star-Buttons mit ECHTEN Zahlen, echte Beschreibung, blaue Topic-Pills, Footer Sprach-Dot+Stars+Lizenz. Star-Count tickt hoch (Proxy steps + manueller Tausender-Formatter, NIE toLocaleString) + Gold-Star-Burst.
- Recherche zwingend vorher: echtes Repo per WebFetch (blader/humanizer: 28.4k Stars, 2.6k Forks, MIT, Sprache Markdown, Desc "Claude Code skill that removes signs of AI-generated writing from text", Install `npx skills add blader/humanizer`, 33 Patterns).
- Weitere bewährte Replica-Beats dieses Sets: Vorher/Nachher-Doku mit Detektor-Badge das 98%→0% flippt (Skill-Node dazwischen), Text-mit-AI-Tells die einzeln dissolven (Checklist echter Pattern-Namen, Counter 6→0, CLEAN-Stempel), Voice-Fingerprint (Waveform draw-on + Tone-Dial + Signaturwort-Chips), getippter Output + Match-Gauge 100% + Signatur-Scribble, Terminal-1-Command-Install.

## Baked SFX in HyperFrames (funktioniert, Tag 155)
- SFX mit ffmpeg synthetisieren (siehe [[ffmpeg-sfx-synth]]), .wav in JEDEN Comp-Ordner als `sfx.wav` kopieren.
- Ins root-div ein `<audio id="sfx" data-start="<payoff-t>" data-duration="<len>" data-track-index="1" src="sfx.wav" data-volume="0.85"></audio>` einfügen (direkt nach dem `data-duration="5">` des root). data-start auf den PAYOFF-Moment legen (Verdict-Pop / Match-100 / Install-Success), nicht auf 0.
- Lint bleibt 0/0, Render meldet `"hasAudio":true`, MP4 hat video+audio-Stream (mit ffprobe verifizieren). Zusätzlich die nackten .wav in `out/sfx/` lassen, falls er in CapCut selbst platzieren will.

## Zwei harte Render-Fallen (gekostet je 1 Iteration)
- **SVG-`<line>`-Nadel rotiert kaputt** trotz `svgOrigin` (verschwand / stand falsch im finalen Render — Web-Preview kann täuschen). Fix: Nadel als **HTML-`<div>`** (dünner Balken) mit `transform-origin:50% 100%` bauen und per GSAP `rotation` drehen. HTML-Rotation ist zuverlässig, SVG-Rotation in diesem Renderer nicht. Immer per gerendertem Frame gegenprüfen, nicht dem Preview glauben.
- **`transform:scaleX()`-Fill-Balken bleibt unsichtbar**, wenn das Element keine explizite `width` hat (leerer `<span>` = 0px breit → scaleX(1) bleibt 0). Immer `display:block;width:100%` auf Fills die per scaleX animiert werden.

Verwandt: [[hyperframes-multi-comp-batch]], [[hyperframes-local-fonts]], [[light-backgrounds-only]], [[ffmpeg-sfx-synth]], [[theme-clean-editorial]]
