# B-Roll-Ersteller — Claude-Code-Agent

Ein Claude-Code-Agent, der aus einem Kurzvideo-Skript (Instagram/TikTok Reels) fertige B-Roll-MP4s produziert — end-to-end: Skript-Teile mappen, pro Teil eine animierte Metapher bauen (HTML + GSAP via [HyperFrames](https://www.npmjs.com/package/hyperframes)), QA-Checks, rendern, visuell verifizieren, Ordner öffnen. Du ziehst die Clips nur noch in CapCut.

Destilliert aus vielen Monaten täglicher Produktion und Feedback-Runden. Der Stil ("SKAILE-Stil"): heller Cream-Hintergrund, Coral-Akzent, gezeichnete SVG/CSS-Visuals statt Emojis, eine erzählende Metapher pro 5-Sekunden-Beat.

## Was drin ist

```
agent/broll-ersteller.md   → Agent-Definition (System-Prompt mit Ablauf, Stil-DNA, Fallen-Liste)
agent-memory/              → Starter-Memory: gelernte Patterns, Anti-Patterns, technische Fallen
template/
├── CHECKLISTE.md          → verbindlicher Ablauf pro Set
├── _TEMPLATE/             → Master-Template (index.html + lokale Fonts) — wird pro Beat kopiert
├── examples/              → zwei fertige Beispiel-Beats zum Ansehen/Rendern
└── assets/                → z.B. OpenAI-Logo-Path für Replicas
install.sh                 → kopiert alles an die richtigen Stellen (mit Backup)
SETUP-PROMPT.md            → Prompt, den du einfach in Claude Code pastest
```

## Voraussetzungen

- [Claude Code](https://claude.com/claude-code)
- Node.js ≥ 18 (für `npx hyperframes`)
- ffmpeg (`brew install ffmpeg`)

## Installation

**Einfachster Weg:** Öffne Claude Code und paste den Prompt aus [`SETUP-PROMPT.md`](SETUP-PROMPT.md). Claude erledigt alles.

**Manuell:**

```bash
git clone https://github.com/sebaskauf/broll-ersteller-agent.git ~/Documents/Projects/broll-ersteller-agent
cd ~/Documents/Projects/broll-ersteller-agent
./install.sh
npx --yes hyperframes skills   # HyperFrames+GSAP-Skills für Claude Code
npx --yes hyperframes doctor   # Render-Umgebung prüfen
```

Danach Claude Code neu starten.

## Benutzung

Neue Claude-Code-Session, dann z.B.:

> B-Roll für dieses Skript. Ich brauche Visuals für diese 4 Stellen: 1. "…" 2. "…" 3. "…" 4. "…"
>
> [ganzes Skript als Kontext]

Der Agent triggert automatisch auf "b-roll"/"visuals"/"footage". Er baut pro genannter Stelle genau einen 5s-Clip (1920×1080, 30fps), rendert, prüft die Frames selbst und öffnet am Ende den Output-Ordner.

**Wichtig:** Nummerierte Stellen = exakte Clip-Anzahl. Der Agent zerlegt nicht das ganze Skript, wenn du bestimmte Stellen nennst.

## Test nach der Installation

```bash
cd ~/Documents/Projects/broll-set-template/examples
npx --yes hyperframes render 01-gedaechtnis-voll --quality high --output test.mp4
```

## Anpassen

Alles ist offener Text/HTML — fork das Repo und ändere:

- **Stil-DNA** (Farben, Typo, Motion): in `agent/broll-ersteller.md`
- **Master-Template**: `template/_TEMPLATE/index.html`
- **Gelernte Patterns**: `agent-memory/*.md` — der Agent pflegt sein Memory selbst weiter, wenn du ihn korrigierst
- **Modell**: Frontmatter `model: opus` in der Agent-Datei (z.B. auf `sonnet` ändern)

Hinweis: Einige Memory-Files referenzieren historisch ein privates Remotion-Projekt (`katchup-lead-automation/tiktok-broll`) — das ist nicht Teil dieses Repos. Der HyperFrames-Weg ist der Standard und vollständig enthalten.

## Lizenz

MIT (siehe [LICENSE](LICENSE)). Die eingebetteten Fonts (Inter, JetBrains Mono, Newsreader) stehen unter der [SIL Open Font License 1.1](template/_TEMPLATE/assets/fonts/LICENSE-FONTS.txt).

Gebaut von [Sebastian Kauffmann](https://github.com/sebaskauf) (SKAILE) mit Claude Code.
