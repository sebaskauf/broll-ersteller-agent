---
name: anker-compositions-mapping
description: Welche existing Composition liefert welches Pattern. Vor jedem Build die richtige Anker-Composition lesen statt raten.
metadata:
  type: reference
---

# Anker-Composition-Mapping

Wenn ich eine neue B-Roll-Composition baue, lese ich VOR dem Schreiben die passende Anker-Composition. Sebastian's Style ist konsistent über Tag-Sets — Pattern-Reuse ist Pflicht, nicht Option.

## Repository

`~/Documents/Projects/katchup-lead-automation/tiktok-broll/src/compositions/`

## Anker-Mapping nach Pattern

### Hook / Opener Compositions

| Was du baust | Anker-Datei | Anker-Funktion | Was du dort siehst |
|---|---|---|---|
| Big-Number + Service-Name + Tagline | `McpsTag110.tsx` | `HookScene` | Number pop + typewriter + accent underline + glow + orbit-dots |
| Tamagotchi-Center mit verstreuten Agents drumherum | `EccV3PluginBRoll.tsx` | `EccV3_01_TamagotchiCenter` + `SATS_V3` | 30 satellites, 3 rings, orbital motion nach spawn |
| Tool-Logo + Stats-Card | `GstackBRoll.tsx` | `Gstack_Intro` | YC-Badge + Garry-Name + animated counter |

### Stats / Counter / Numbers

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| 3-Card Counter-Grid mit Cross-Connections | `EccV3PluginBRoll.tsx` | `EccV3_02_Stats` |
| Animated single counter mit Ring | `SessionHandoffBRoll.tsx` | `SessionHandoff_Hook` (Quality-Decay-Chart Pattern) |
| Tool-Count Pack-Style | `GstackBRoll.tsx` | `Gstack_Intro` (tool counter top right) |

### Code / Terminal / Editor

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| VS-Code-Editor mit Syntax-Highlighting + Scanner | `EccV3PluginBRoll.tsx` | `EccV3_04_SecurityScan` |
| Install-Terminal mit typewriter + progress + status-lines | `CodexComboBRoll.tsx` | `Combo_InstallNext` |
| Compact-Fails Terminal mit before/after Quality | `SessionHandoffBRoll.tsx` | `SessionHandoff_CompactFails` |
| Mehrere Terminals gleichzeitig (Team-Work) | `EccV3PluginBRoll.tsx` | `EccV3_07_TeamWork` |

### Cards / Grids / Lists

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| 6-Card Grid (3x2) mit Connection-Web | `EccV3PluginBRoll.tsx` | `EccV3_06_MoreAgents` |
| 5-Role Grid mit Icons | `GstackBRoll.tsx` | `Gstack_Rollen` |
| Document-Card mit 3 Section-Cards (Anthropic-Editorial) | `SessionHandoffBRoll.tsx` | `SessionHandoff_Contents1` |
| Project-List die sich aktiviert | `EccV3PluginBRoll.tsx` | `EccV3_03_SofortNutzbar` |

### Side-by-Side / Comparison

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| Alt vs Neu (Session 1 vs Session 2) | `GehirnBRoll.tsx` | `Gehirn_Problem` |
| Tool A neben Tool B mit Status | `CodexComboBRoll.tsx` | `Combo_InstallNext` (Claude + Codex Cards) |
| Old → Doc → New 3-Spalten-Flow | `SessionHandoffBRoll.tsx` | `SessionHandoff_NeedHandoff` |

### Kanban / Board / Workflow

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| Notion/Linear-style Sprint-Board mit moving Tasks + Complete-Celebration | `EccV3PluginBRoll.tsx` | `EccV3_05_Planning` |

### Charts

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| Line-Chart über Sessions mit Datapoints + Area-Fill | `EccV3PluginBRoll.tsx` | `EccV3_09_SelfImprove` |
| Quality-Decay-Chart mit Zone-Backgrounds | `SessionHandoffBRoll.tsx` | `SessionHandoff_Hook` |
| Multi-Session-Chart auf Healthy-Plateau | `SessionHandoffBRoll.tsx` | `SessionHandoff_Maximum` |
| Timeline mit Decay + End-Marker | `SessionHandoffBRoll.tsx` | `SessionHandoff_AtTheEnd` |

### Skills / Library / Grid

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| Skills-Library mit Counter + Live-Retrieval-Stream | `EccV3PluginBRoll.tsx` | `EccV3_08_SkillsAccess` |

### Nummerierte Schritt-Intros (1./2./3./4. Listen-Videos)

Sebastian hat eine WIEDERKEHRENDE Vorlage für „erstens/zweitens/…"-Videos. Bei Listen-Skripten exakt nachbauen:
- Vorbild: `SetupStep1Intro.tsx`..`SetupStep4Intro` (Original) bzw. `SetupMaxBRoll.tsx::NumberedIntro` (Tag 121, neueste).
- Aufbau: weißer BG, zentriert. Großes schwarzes „N." (Mono ~72-78px, weight 800, scale-in spring 0.6→1). Daneben oranger Typewriter-Titel (#D97757, Mono ~62px) + BlinkingCursor. Darunter graue Mono/Sans-Subline (#999, ~26px, Pfad/Kurzinfo) mit fade+slideUp. Weicher oranger Radial-Glow dahinter, pulsierend.
- Struktur des Sets: Pro Listenpunkt = 1 nummerierter Intro-Clip + danach 2-3 Inhalts-Clips (sehr lange Sätze 3-4). Hook/Outro/CTA nur wenn explizit gewünscht (Tag 121 wollte er sie NICHT).

### CTA / Outro

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| "schreib X in die Kommentare" CTA | `AgentPluginBRoll.tsx` | `Agent_20_CTA` |

### Helper-Components (in ALLEN guten Comps drin)

Wenn du den Code siehst willst:

| Helper | In | Was es macht |
|---|---|---|
| `FontFace` | `EccV3PluginBRoll.tsx` (top) | Anthropic-Sans/Mono inline-load via staticFile |
| `CardFrame` | `SessionHandoffBRoll.tsx` (top) | 1200×700 zoom-safe inner container |
| `WindowChrome` | `SessionHandoffBRoll.tsx`, `EccV3PluginBRoll.tsx`, alle gefeierten | Terminal-Mockup mit Traffic-Lights, optional `live` prop |
| `SectionLabel` | `GehirnBRoll.tsx`, `EccV3PluginBRoll.tsx` | Mono 11px UPPERCASE letter-spacing 0.12em mit spring-opacity |
| `PulseDot` | überall | Continuous opacity-pulse mit boxShadow glow |
| `FloatingDots` | `EccV3PluginBRoll.tsx` | Background-Motion mit sin/cos-orbits |
| `AgentIcon` | `EccV3PluginBRoll.tsx` | 8 Inline-SVG-Icons für Agent-Avatare (Shield, List, Eye, Building, Lightning, Brackets, Clock, Search) |
| `useTypewriter` + `BlinkingCursor` | `src/utils/animations.tsx` | Typewriter-Animation für Terminal-Commands |

### Graph / Second-Brain / Vernetzung

| Was du baust | Anker-Datei | Anker-Funktion |
|---|---|---|
| Obsidian-Graph-View (Hub + Cluster + Leaves + Cross-Links, deterministisch, animierter Build) | `SecondBrainBRoll.tsx` | `ObsidianGraph` Helper + `buildGraph()` + `Brain_11_Structure` |
| Wiederverwendbar für: "Second Brain", "alles vernetzt", "Struktur aufbauen", Wissens-/Memory-Graph. Props `t0`/`scale`/`flow`/`crossDelay` steuern Build-Tempo. Claude-Orange Hub, farbige Cluster (orange/blau/grün/teal). |

### GrillMe-Set (Tag 122) — NEUE bestätigte Pattern-Typen

`GrillMeBRoll.tsx` — von Sebastian explizit gefeiert ("wirklich extrem gutes B-Roll", 07.06.2026). Liefert Metaphern die EccV3/SessionHandoff NICHT hatten. Bei Erklär-/Listen-Skripten mit nummerierten Teilen = genau so viele individuelle Comps, jede eigene Metapher (siehe [[eyecatchier-dense-brolls]]).

| Was du baust | Anker-Funktion | Kurz |
|---|---|---|
| Exponential-Growth-Chart (z.B. GitHub-Stars über Wochen) | `Grill_02_Stars` | Steile Kurve auf Zielwert, Counter racet + `toLocaleString`, ★/Sparkles floaten, "TRENDING #1" |
| Massen-Phänomen ("alle machen X") | `Grill_03_BiggestMistake` | 6×4 Mini-Karten-Grid, diagonale Fehler-Welle (col+row Timing), dann großer Stat-Badge "94%" slammt mit Shockwave-Ring |
| Chaos / falscher Ansatz | `Grill_04_WrongApproach` | Roadmap überspringt durchgestrichenen Node → roter Spaghetti-Tangle (bezier-Kanten + flowing particles) + rotierter Stempel |
| 1 Input → wildes Spawning | `Grill_05_OneSentence` | Prompt-Box typewriter + Enter-Glow → Terminal streamt Files schnell + racing File-Counter + chaotische Mini-Bars |
| Confident-Wrong / Kontrast-Bars | `Grill_06_ConfidentWrong` | 2 horizontale Balken (Confidence 100% grün vs Intent 26% rot) + 2 Stempel die sich überlagern (✓ FERTIG → ✗ FALSCH mit shake) |
| Hero-Lösung-Slam | `Grill_07_Solution` | Skill-Card slammt mit overshoot + emittierende Shockwave-Ringe, rote Problem-Chips flippen einzeln zu grün ✓ (line-through) |
| Reihenfolge umdrehen / Swap | `Grill_08_FlipApproach` | 2 Karten tauschen Slots per Arc (sin-arc + ease), Reversal-Pfeil ⟲ rotiert 0→180°, Farb-Flip rot→grün/orange |
| Doc schreibt sich live | `Grill_09_PlanDoc` | WindowChrome `PLAN.md`, `typed()`-Helper section-weise (h1/h2/bullet), Cursor + Section-Checklist die abhakt |
| Q&A einzeln + Decision-Tree | `Grill_10_Questions` | Frage-Bubbles one-at-a-time + "→ Empfehlung"-Antwort, rechts SVG-Decision-Tree dessen Branches grün werden (lit nach t+14) |
| Saubere Architektur-Blueprint | `Grill_11_OptimalPlan` | Boxen (Frontend/API/Auth/DB/Queue) snappen, orthogonale L-Pfad-Connections + flowing particles, "0 offene Fragen" (Kontrast zu Chaos-Tangle) |
| Loop-vs-OneShot Vergleich | `Grill_12_BestResult` | Split + VS-Kreis: links rotierender SVG-Loop-Arc + Counter ×1000 "FESTGEFAHREN", rechts gerader Pfad → grüner ✓ + Sparkles |

Helper neu/nützlich: `DotGrid({id})` (BG dot-pattern, unique id pro Comp), `BottomPill({label,color,dark,delay})` (Status-Pill mit pulse), `Cursor`, `typed(text,startF,frame,cps)` (pure typewriter, kein Hook → kein Rules-of-Hooks-Risiko).

### Zertifikat-/Brand-Logo-Set (Tag 133) — Listicle mit echten Brand-Logos

`CertificatesBRoll.tsx` — "3 wertvollste KI-Zertifikate" (Anthropic/Google/AWS). Liefert wiederverwendbare Bausteine für Brand-/Award-/Vergleichs-Videos:

| Baustein | Funktion | Kurz |
|---|---|---|
| Zertifikat-Karte (Anker-Visual) | `CertCard` | Edle Karte: Top-Accent-Bar, innerer Ornament-Rahmen, Ribbon-Eyebrow, Logo-Slot, Serif-Titel, Siegel unten. Props: accent/soft/border/logo/title/ribbon/reveal/compact/sealText |
| Siegel/Medaille | `Seal` | Gezackter rotierender Kreis (24 Zähne) + ✓ + Text. spin-prop |
| 3 Karten-Intro nebeneinander + Maskottchen | `Cz_01_Intro` | leicht gekippte Karten (rotate -3/0/+3), Stagger-reveal, Tamagotchi hüpft rein, "99%"-Badge, FloatSparks |
| Brand-Logos | `AnthropicLogo`/`GoogleLogo`/`AwsLogo` | Anthropic = PNG `staticFile("anthropic-logo.png")`. Google-G = inline 4-Farben-SVG (Material-Paths). AWS = "aws"-Wortmarke + oranger Smile-Pfeil (inline). Google/AWS NICHT lokal vorhanden → als SVG nachbauen. |
| System-Architektur-Graph | `Cz_04_CcaEnterprise` | Nodes (Claude API/Agents/KB/Tools/Enterprise/Monitoring) + dashed-Links die wachsen + fließende Packets |
| Training-Kurve | `Cz_07_GoogleTrain` | Daten→Modell→Trainiert-Pipeline + steigende Accuracy-Kurve. ⚠️ Kurven-Geometrie MUSS zum Label passen: "accuracy ↑" steigt, "loss ↓" fällt — sonst Widerspruch (Tag 133 V1 stieg trotz "loss ↓" → zu Accuracy umgelabelt). SVG-Breite < Window-Content-Breite halten sonst clippt der rechte Rand. |
| Production-Dashboard | `Cz_11_AwsProd` | 3 Metrik-Karten (req/s count-up, uptime, HEALTHY) + live Traffic-Bars (sin-animiert) |
| Deploy-Terminal | `Cz_10_AwsDeploy` | `$ aws deploy` typewriter + status-lines mit "done" + grüne "app is live"-Pill |

Assets in `public/`: `anthropic-logo.png` (schwarze Wortmarke, transparent), `claude-tamagotchi.png` (oranges Maskottchen, `>` `<` Augen, transparent). KEIN Google/AWS-Logo → inline-SVG. Slack/Gmail/Excel/PayPal etc. liegen in `public/logos/*.svg`.

## Schnell-Lese-Reihenfolge wenn Style unklar

1. **`EccV3PluginBRoll.tsx`** — neuester gefeierter Set, sieh dir komplettes Spectrum an
1b. **`GrillMeBRoll.tsx`** — gefeiertes 12er-Set (Tag 122), neue Metaphern: Chart/Tangle/Swap/Decision-Tree/Loop-vs-OneShot/Hero-Slam
2. **`SessionHandoffBRoll.tsx`** — original Gold-Standard mit CardFrame + WindowChrome Definition
3. **`McpsTag110.tsx`** — wenn Hook-Pattern needed
4. **`GehirnBRoll.tsx`** — wenn Side-by-Side needed
5. **`CodexComboBRoll.tsx`** — wenn Install/Setup-Flow needed
6. **`GstackBRoll.tsx`** — wenn Tool-Pack-Stats needed

## Related

- [[real-style-ui-mockups]]
- [[5sec-min-continuous-motion]]
- [[workflow-broll-creation]]
