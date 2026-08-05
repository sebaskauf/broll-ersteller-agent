---
name: hyperframes-multi-comp-batch
description: Bewährtes Pattern für N einzelne 5s-B-Rolls als HyperFrames-Batch (Tag 150, 10 Comps) — Ordnerstruktur, Lint-0/0-Tricks, Render-Loop
metadata:
  type: reference
---

# HyperFrames: Batch aus N Einzel-Compositions (Tag-150-Pattern)

Tag 150 (04.07.2026): 10 B-Rolls à 5s end-to-end in einer Session gebaut, gelintet, gerendert. Sebastian: "das passt". Setup das funktioniert hat:

**Struktur:** `~/Documents/Projects/tag150-fable5-broll/` mit `01-name/ … 10-name/` — je ein STANDALONE `index.html` (kein `<template>`, `data-composition-id="root"`, `data-duration="5"`) + `assets/fonts/f0-f3.woff2` (aus `skills-broll-skript` kopiert: Inter, JetBrains Mono, Newsreader roman+italic). Root-`package.json` mit `npx --yes hyperframes`-Scripts reicht, kein npm install nötig.

**Batch-Loop:** `for d in 01-* …; do npx --yes hyperframes lint $d; done` → dann `inspect $d` → dann `render $d --quality high --output out/tagN-$d.mp4` (als Background-Task, ~8-15s pro 5s-Clip). QA: `ffmpeg select=eq(n,45)+eq(n,90)+eq(n,141), tile=3x1` Kontaktblätter → mit Read anschauen.

**Lint-0/0-Lektionen (wichtig, spart Iterationen):**
- Wiederholte `fromTo`-Trigger auf DASSELBE Element (Puls je Ereignis) → Linter meldet `overlapping_gsap_tweens`. Fix: EIN Tween mit `repeat` + `repeatDelay` (Zyklus = Ereignis-Abstand) oder `keyframes`-Kette mit Reset-Keyframe am Ende.
- Counter-Ticks: statt N einzelner `'+=x'`-Tweens auf ein Proxy-Objekt → EIN Tween mit `ease:'steps(N)'`, Start = erster Tick minus Zyklus, duration = N×Zyklus. Springt exakt bei jedem Ereignis.
- SVG-Rotation (Uhrzeiger, Ringe): `svgOrigin:'cx cy'` verwenden, NIE `transformOrigin:'140px 140px'` — transformOrigin bezieht sich auf die Element-BBox → Zeiger fliegen aus dem SVG (inspect fängt das als container_overflow).
- Elemente die den Canvas verlassen (Token-Ströme): nach der Reise `tl.set(el,{opacity:0})`, sonst stauen sie sich off-canvas und inspect meldet content_overlap. Wander-Distanz > 1920+Elementbreite.
- ⚠️ NIE relative Werte (`x:'+=200'`) in einer keyframes-Kette mit `repeat` — repeat spielt denselben aufgezeichneten Range erneut ab, das Element springt sichtbar zurück ("Lag", Tag-150-Runner-Bug). Fix: absolute Positionen in EINER keyframes-Kette ausschreiben (x:0→200→200→400…).
- Gewollte Effekt-Layer über Text (Scan-Beam, Shine-Sweep, Preis-Tag überm Label): `data-layout-allow-occlusion` + ggf. `data-layout-allow-overlap` ans TEXT-Element; gewollter Overflow (Sweep startet außerhalb): `data-layout-allow-overflow`.

**Zoom-Safe konkret:** Kern in x 360-1560 / y 190-890. Kicker-Zeile top:222, Bottom-Pills bottom:206-216 — beides bleibt damit in der 1200×700-Zone.

**Set-Aufbau als bestätigtes Template (10./11.07.2026):** Sebastian zum tag157-Sol-Set: "vom Aufbau her fand ich das B-Roll gestern extrem gut" → Standard für neue Sets: pro Beat EIN Metapher-Card-Layout auf #FAF9F5+tex-Squiggle, Mono-Kicker oben (Kernwort coral <b>), dunkle Bottom-Pill mit Spark, floating White-Cards mit warmem Schatten, Coral #DA7756 Leitakzent (+ Gegenspieler-Akzent wie OpenAI-Grün #10A37F), Motion bis Frame 150. Bei Folge-Sets weniger Verify-Runden gewünscht: 1× lint+inspect (0 errors/0 warnings reicht, Infos ok), rendern, EIN End-Frame-Kontaktblatt, öffnen.

Verwandt: [[reference_hyperframes_local_fonts]], [[feedback_no_emojis_drawn_visuals]], [[workflow_broll_creation]], [[hyperframes-replicas-and-sfx]]
