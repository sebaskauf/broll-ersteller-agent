---
name: real-style-ui-mockups
description: Sebastian's echter B-Roll-Stil ist UI-Mockups (Terminals, Editors, Boards) im Anthropic-Look — NICHT abstrakte Organisms, Networks oder Trees. Korrektur vom 26.05.2026.
metadata:
  type: feedback
---

# Sebastian's tatsächlicher B-Roll-Stil

Am 26.05.2026 in Tag 111 (ECC Plugin) komplett daneben gelegen mit abstrakten Organism/Network/Honeycomb/Tree-Visualisierungen. Sebastian sagte "wirklich gar nicht, wie ich meine B-Rolls haben möchte". Style-Korrektur basierend auf Analyse seiner gefeierten Compositions.

**Why:** Sebastian's echter Stil ist konsistent über alle gefeierten Compositions (Session-Handoff, Gehirn, Mcps, Gstack, CodexCombo). Es ist NICHT abstrakt-organisch, sondern **UI-Mockup-getrieben mit Anthropic-Brand-DNA**. Wenn ich abstrakt werde (Organisms, Trees, Honeycombs, Speedometer, Pixel-Charaktere), liegt es daneben.

**How to apply:** Bei jeder neuen B-Roll-Composition: Frag dich "Was ist die UI die das visualisiert?". Statt "Network-Graph für Team" → "6 Terminals nebeneinander mit live-tasks". Statt "Tree für Wachstum" → "Line-Chart mit echten Datapoints über Sessions". Statt "Speedometer" → "echtes Skills-Library-Window mit Counter und live-retrieval-list".

## Pflicht-Elemente in jeder Composition

1. **`WindowChrome`** für zentrale Elemente — Traffic-Lights (red/yellow/green 10px circles), `borderRadius: 14`, `border: 1px solid #E5E5E5`, `boxShadow: "0 8px 40px rgba(0,0,0,0.06)"`, Header-Background `#F5F5F5`, optional `live` prop mit pulsing dot
2. **`SectionLabel`** oben — Mono 11px, fontWeight 700, letter-spacing 0.12em, UPPERCASE, color muted
3. **`PulseDot`** — continuous `0.4 + 0.6 * (0.5 + 0.5 * Math.sin(frame * 0.18))` mit boxShadow glow
4. **Status-Pill unten** — kleine pill mit PulseDot + UPPERCASE-Label (z.B. "PRO SETUP · LIVE")
5. **Continuous motion** — Floating-Dots im BG, breathing scales, pulsing dots, flowing particles

## Konkrete UI-Patterns die er liebt

| Concept | RICHTIG (UI-Mockup) | FALSCH (abstract) |
|---|---|---|
| "X Stats" | 3 Cards mit count-up, PulseDot READY, border in accent | 3 Ringe mit Honeycomb |
| "Code-Scan" | VS-Code-Editor mit Syntax-HL + scanning progress + Findings-list | Code-Stream + Beam |
| "Team-Work" | 6 simultane Terminals mit live tasks, alle verbunden zu Project-Hub | Orbit-Network |
| "Self-Improving" | Line-Chart mit echten Sessions auf X-Achse, Datapoints poppen rein | Tree mit Branches |
| "Task-Management" | Notion/Linear-style Board mit echtem Sprint-Header, Cards bewegen sich | Generic 3-Spalten-Kanban |
| "Skills-Library" | WindowChrome `.claude/skills/` + Grid + Live-Retrieval-Window mit Skill-Names | Honeycomb-Pulses + Speedometer |
| "Install" | Terminal mit echtem typewriter command + status-lines stream | Big text card |
| "Agent-Card" | Card mit Icon + AGENT label + Task-description + Status-pill | Pixel-Charakter-Kopf |

## Code-Editor Syntax-Highlighting Colors (VS-Code Dark)

```ts
"#C586C0" // keywords (function, const, return)
"#569CD6" // var declarations (const, let)
"#DCDCAA" // function names
"#9CDCFE" // variable names
"#CE9178" // strings
"#D4D4D4" // default text
"#4a5563" // line numbers
"#0F1217" // editor BG
```

## Leitfarbe: Anthropic-Orange, NICHT Lila

Am 29.05.2026 (Tag 114) explizit: "passe alle B-Rolls so an dass sie im Claude-Style sind statt im Lila-Style". Claude-Style = **Anthropic-Orange #D97757 als dominante Leit-/Akzentfarbe** (SectionLabels, WindowChrome-Accent, Status-Pills, Hauptzahlen, Primär-Linien). Lila (#A855F7) und helles Cyan als Haupt-Akzent vermeiden. Grün = Erfolg, Rot = Fehler, Blau/Amber/Teal als Neben-Akzente sind ok. Bei Multi-Color-Swarms ruhig Vielfalt, aber orange-geführt und KEIN Lila-dominantes Gesamtbild.

## Was er HASST (explizit oder implizit)

- ❌ Abstrakte Network-Graphs ohne UI-Context
- ❌ Tree/Branches-Diagramme (von vorne bis hinten "abstract organism")
- ❌ Honeycomb-Grids ohne klaren Skills-Library-Kontext
- ❌ Speedometer/Tachometer als isoliertes Element
- ❌ Pixel-Charakter-Köpfe als "Agents"
- ❌ Generic Organism mit Particles (zu abstrakt, kein Konkretes was er zeigen kann)
- ❌ Cream BG bei Performance-relevanten Tag-Videos (weiß ist sein Default)
- ❌ Zu wenig Substanz — "kein Wort sehen" heißt nicht "keine Konkrete UI"

## Anker-Compositions für Pattern-Reuse

Vollständiges Mapping siehe [[anker-compositions-mapping]]. Top-Highlights:

| Anker | Datei | Wofür |
|---|---|---|
| Window-Chrome Standard | `SessionHandoffBRoll.tsx` `WindowChrome` | Pattern für Terminal-Mockups |
| HookScene mit Number+Name | `McpsTag110.tsx` `HookScene` | Big-Number Hook mit typewriter + accent underline |
| Side-by-Side mit Arrow | `GehirnBRoll.tsx` `Gehirn_Problem` | alt vs neu comparison |
| Tamagotchi Center mit Orbiting Satellites | `EccV3PluginBRoll.tsx` `EccV3_01_TamagotchiCenter` | 30 Satellites, verstreut, schneller spawn, orbital motion |
| 6 simultane Terminals | `EccV3PluginBRoll.tsx` `EccV3_07_TeamWork` | Team-work Pattern statt Network-Graph |
| VS-Code Syntax-Editor | `EccV3PluginBRoll.tsx` `EccV3_04_SecurityScan` | Code-Scan Pattern |

## Bug-Hinweis: Off-by-one bei Chart-Daten

Bei `dataPoints` mit Animation-Reveal IMMER:
```ts
const visibleN = Math.min(dataPoints.length - 1, Math.floor((dataPoints.length - 1) * progress));
// dann: for (let i = 0; i <= visibleN; i++)
```
Sonst `dataPoints[i] is undefined` Crash am Ende.

## Related
- [[real-style-ui-mockups]]
