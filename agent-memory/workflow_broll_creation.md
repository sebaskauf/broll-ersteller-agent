---
name: workflow-broll-creation
description: End-to-end Workflow von Sebastian's Skript-Brief bis zum gerenderten B-Roll-Ordner. Disziplinierter Prozess der die häufigen Failure-Modes vermeidet.
metadata:
  type: reference
---

# B-Roll Creation Workflow (End-to-End)

Dieser Workflow vermeidet die Failure-Modes der ersten Sessions: ausgelassene B-Rolls, falscher Style, zu kurze Comps, Animation-Stop in letzten Sekunden.

## Phase 1 — Skript-Parsing (NICHT überspringen)

### Was Sebastian schickt
Oft als Sprachnachricht-Transkript: ein Skript + freihändige Anweisungen wo welche B-Rolls hin sollen. Beispiel: "Ok also ich will B-roll für diesen Teil hier. Das hier ist ECC... Für den Teil hier Planning Agent... für die auch B-Roll...".

### Was du machst
1. **Skript-Text isolieren** — nur die zu sprechenden Sätze, nicht Sebastian's Meta-Kommentare
2. **JEDE Stelle wo Sebastian "hierfür" / "für den Teil" / "auch B-Roll" sagt = 1 B-Roll-Bedarf** zählen. NICHTS auslassen.
3. **Bei expliziten Split-Anweisungen** ("in 2 B-Rolls verpackt: bis hier ein B-Roll und dann ab hier ein B-Roll") → genau befolgen.
4. **Bei vielen Wiederholungen oder unklarer Anzahl** → 1 Cut alle 3-5 Sekunden Sprech-Zeit ist Standard. Wortzahl × (60/145) = grobe Sekunden.

### Output: Beat-Plan-Tabelle

```markdown
| # | Snippet | Dauer | Visual-Konzept | Anker |
|---|---|---|---|---|
| 01 | "Das hier ist ECC..." | 6s | Tamagotchi mit verstreuten Agent-Satelliten | EccV3_01_TamagotchiCenter |
| 02 | "61 Agents, 246 Skills, 76 Commands" | 5s | 3 Stats-Cards mit count-up + Cross-Connections | EccV3_02_Stats |
| ... |
```

Diese Tabelle **immer Sebastian zeigen vor dem Build**, außer er sagt "mach mal direkt" oder ähnlich. Bei Zustimmung → bauen.

## Phase 2 — Composition-File schreiben

### Datei-Konvention
- Pfad: `~/Documents/Projects/katchup-lead-automation/tiktok-broll/src/compositions/{Topic}PluginBRoll.tsx` (bzw. `{Topic}BRoll.tsx`)
- Versions-Suffix wenn iteriert: `{Topic}V2`, `{Topic}V3` (komplett neu, NICHT die alten überschreiben — Sebastian sagt manchmal "lass die alten so")

### Struktur-Template
```tsx
import React from "react";
import { AbsoluteFill, useCurrentFrame, useVideoConfig, spring, interpolate, staticFile, Img } from "remotion";
import { useTypewriter, BlinkingCursor } from "../utils/animations";

// === BRAND TOKENS ===
const C = { /* Anthropic palette */ };
const F = { sans: "'Anthropic Sans', ...", mono: "'Anthropic Mono', ..." };
const CARD_W = 1200; const CARD_H = 700;

// === FONTS ===
const FontFace: React.FC = () => (<style>{`@font-face {...}`}</style>);

// === HELPERS ===
const CardFrame: React.FC<{children}> = ({children}) => (...);
const WindowChrome: React.FC<{...}> = (...) => (...);
const SectionLabel: React.FC<{...}> = (...) => (...);
const PulseDot: React.FC<{...}> = (...) => (...);
const FloatingDots: React.FC<{...}> = (...) => (...);

// === COMPOSITIONS ===
export const Topic_01_Name: React.FC = () => { ... };
export const Topic_02_Name: React.FC = () => { ... };
// ...
```

Helper-Components **lokal in der File**, nicht von anderen Compositions importieren. So bleibt Datei self-contained und Änderungen brechen keine alten Sets.

### Pflicht-Elemente pro Composition
- `<CardFrame>` als root (auto: 1200×700 zoom-safe inner)
- `<SectionLabel>` oben mit Kontext (z.B. "Security Agent · Scan läuft")
- `<PulseDot>` mit `live={true}` falls WindowChrome verwendet wird
- **Status-Pill unten** mit Final-State-Label
- **Continuous Motion** (siehe [[5sec-min-continuous-motion]])

## Phase 3 — Registrierung in Root.tsx

### Import-Block (am Ende der Imports)
```tsx
import {
  Topic_01_Name,
  Topic_02_Name,
  // ...
} from "./compositions/TopicBRoll";
```

### Composition-Block (am Ende vor `</>` und `}`)
```tsx
{/* Tag {N} — {Topic} B-Rolls ({Datum}) — {kurzer Notiz wenn iteriert} */}
<Composition id="Topic-01-Name" component={Topic_01_Name} durationInFrames={150} fps={FPS} width={HORIZONTAL.width} height={HORIZONTAL.height} />
<Composition id="Topic-02-Name" component={Topic_02_Name} durationInFrames={180} fps={FPS} width={HORIZONTAL.width} height={HORIZONTAL.height} />
```

**WICHTIG: `durationInFrames` mindestens 150 (5s). Niemals 120 ohne expliziten Grund.**

## Phase 4 — TypeScript-Check

```bash
cd ~/Documents/Projects/katchup-lead-automation/tiktok-broll && \
  npx tsc --noEmit 2>&1 | grep -E "TopicBRoll|Root\.tsx" | head -20
```

Wenn leer → clean. Wenn nicht leer → fix die spezifischen Errors (oft Comma/Klammer-Fehler).

**Ignorieren:** dom-webcodecs Errors, esModuleInterop Warnings — sind irrelevant fürs Rendering.

## Phase 5 — Render

### Output-Folder-Konvention
```bash
mkdir -p ~/Documents/Projects/katchup-lead-automation/tiktok-broll/out/tag-{N}-{topic}/
```

### Sequential-Render im Background (für >3 Comps)
```bash
cd ~/Documents/Projects/katchup-lead-automation/tiktok-broll && \
for c in "Topic-01-Name:01-Name" "Topic-02-Name:02-Name"; do
  id="${c%%:*}"
  file="${c##*:}"
  echo ">>> Rendering $id -> $file.mp4"
  npx remotion render src/index.ts "$id" "out/tag-{N}-{topic}/$file.mp4" --codec h264 --crf 1 2>&1 | tail -2
done && \
echo "===DONE===" && \
open out/tag-{N}-{topic}/
```

Mit `run_in_background: true` und `timeout: 600000` (10 Min). Bei 9-20 Comps dauert ~3-7 Min.

### Wenn ein Render crashed
- Output-File mit specific Render allein laufen lassen (ohne `tail -2`) um vollen Error zu sehen:
```bash
npx remotion render src/index.ts "Topic-01-Name" "out/.../01-Name.mp4" --codec h264 --crf 1
```
- Häufiger Bug: Off-by-One bei Chart-Daten (`dataPoints[i]` undefined). Fix:
```ts
const visibleN = Math.min(arr.length - 1, Math.floor((arr.length - 1) * progress));
```

## Phase 6 — Abschluss

### Report-Format an Sebastian
```markdown
# B-Rolls fertig: Tag X — {Topic}

✅ N Compositions gerendert in `out/tag-X-topic/`
✅ Ordner aufgemacht

## File-Liste
| # | Datei | Snippet | Visual |
|---|---|---|---|
| 01 | `01-Name.mp4` | "..." | ... |
...
```

### Ordner aufmachen
```bash
open ~/Documents/Projects/katchup-lead-automation/tiktok-broll/out/tag-{N}-{topic}/
```

## Spezial-Fall: Sebastian schickt Asset (Tamagotchi etc.)

macOS Desktop ist via TCC für mich gesperrt. Wenn Sebastian sagt "ist auf meinem Desktop":

1. Versuche: `cp ~/Desktop/"Datei.png" public/...` — wird vermutlich failen mit "Operation not permitted"
2. Wenn fail: Sebastian bitten **EINEN** Befehl im eigenen Terminal zu laufen:
```bash
cp ~/Desktop/"Datei.png" ~/Documents/Projects/katchup-lead-automation/tiktok-broll/public/asset-name.png
```
3. Verifizieren via `ls -la <pfad>` (das funktioniert für Files mit absolutem Pfad, nur `ls Desktop/` ist geblockt)
4. In Composition via `staticFile("asset-name.png")` referenzieren

## Spezial-Fall: Sebastian fordert Iteration ("baue v3")

- **Existing alte Compositions NICHT überschreiben** — Sebastian sagt manchmal "lass die alten so, mach neue"
- Neue Datei `{Topic}V{N}PluginBRoll.tsx` anlegen, neue Composition-IDs mit `V{N}` Prefix
- Beim Render in NEUEN out-Folder `tag-{N}-{topic}-v{N}/` schreiben

## Spezial-Fall: Video-Cut (A-Roll mit Take-Wiederholungen schneiden)

Wenn Sebastian Roh-Aufnahme schickt für Auto-Cut:
1. ffmpeg → 16kHz mono WAV extrahieren
2. Whisper (`medium` Modell, `--word_timestamps True`, `--language de`, `--output_format json`)
3. Skript-Match: Original-Skript-Sätze gegen Transcript fuzzy-matchen, letzten Take pro Satz wählen
4. ffmpeg → 4K60 HEVC zu 1080p30 H.264 Proxy (sonst Remotion lahm)
5. Remotion Split-Screen (1080×1920 9:16): B-Roll oben, Sebastian unten via `<OffthreadVideo startFrom endAt>`
6. Render → MP4 für CapCut

**Disclaimer:** Whisper ±100ms Drift, keine Energy-Beurteilung. Rough-Cut zu 70-80% nutzbar, Rest in CapCut nachjustieren.

## Related

- [[real-style-ui-mockups]]
- [[5sec-min-continuous-motion]]
- [[anker-compositions-mapping]]
