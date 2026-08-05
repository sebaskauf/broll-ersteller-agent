---
name: grillme-quality-benchmark
description: GrillMe-Set (Tag 122) ist Sebastians Qualitäts-Benchmark. B-Rolls müssen terminal-lastig, dicht, detailreich und animiert sein — NICHT simple Karten mit Label.
metadata:
  type: feedback
---

# GrillMe-Niveau ist der Qualitäts-Maßstab

Sebastian am 15.06.2026 (Tag 127, Loops V1) deutlich: "die B-Rolls sind ganz okayisch aber nicht gut genug, eigentlich wirklich gar nicht gut: viel zu wenig im Terminal, viel zu wenig im Detail visualisiert, viel zu wenig coole Animation, viel zu wenig Kreativität. Ich will das so haben wie in dem damaligen Video von dem GrillMe-Skill."

**Why:** Mein erstes Loops-Set war zu minimalistisch — einfache Karten mit Icon + Label, wenig Terminal, wenig Bewegung. Für Sebastian ist das "gar nicht gut". Sein Benchmark ist das GrillMe-Set (`GrillMeBRoll.tsx`, Tag 122) — dort ist jeder Beat dicht, terminal-/code-lastig, mit echten Mockups und vielen animierten Details.

**How to apply — jeder Beat MUSS mehrere davon haben:**

- **Echte Terminal-/Editor-Mockups mit Inhalt**: WindowChrome mit echtem Code (Syntax-Highlighting), Status-Lines, Streams, Diffs, Progress-Bars. NICHT nur eine Headline + Icon.
- **Code auf weissem Editor-BG**: Terminals bleiben weiss (siehe [[eyecatchier-dense-brolls]]). Für Syntax-Highlighting GitHub-Light-Farben nutzen (keyword `#CF222E`, string `#0A3069`, function `#8250DF`, var `#953800`, number `#0550AE`, comment `#6E7781`, default `#1F2328`, line-no `#AFB8C1`) — VS-Code-Dark-Farben (Gelb #DCDCAA etc.) sind auf Weiss unlesbar.
- **Coole Animationen**: Shockwave-Ringe, flowing particles entlang Linien, spawn mit spring-overshoot (damping 8-11), rotierende Loop-/Ring-Glyphen, count-ups, race-Counter, Hero-Slam, Stempel mit shake.
- **Dichte / viel zu sehen**: mehrere Elemente pro Beat (Grids, gestapelte Bubbles, Multi-Panel-Dashboards, Vorher/Nachher-Vergleiche), nicht 1 zentrales Element auf leerer Fläche.
- **Kreative eigene Metapher pro Beat** (Code-Diff der rot→grün flippt, autonomes Mission-Control mit mehreren laufenden Loop-Bars, Time-wasted-Dashboard mit Uhr + Metrik-Counter, Chat-Mockup mit Bubbles + Avataren, etc.).
- Trotzdem **"mega einfach dargestellt"**: dicht heisst nicht chaotisch — eine klare Hauptaussage pro Beat, sauber lesbar.

Gold-Standard-Anker zum Vorher-Lesen: `GrillMeBRoll.tsx` (siehe [[anker-compositions-mapping]]). Wenn ein Beat sich anfühlt wie "Karte mit Icon + Text" → STOP, terminal-/detail-lastiger neu bauen.

## Reusable Helper dafür
`CodeRow` (Zeilennummer + Token-Array mit Farben + optional reveal/diff-bar), GitHub-Light-Token-Theme `K`, `LoopGlyph` (rotierender Kreis-Pfeil). In `LoopsBRoll.tsx` (Tag 127 V2) als Referenz.

## Related
- [[eyecatchier-dense-brolls]]
- [[anker-compositions-mapping]]
- [[exact-parts-direct-execution]]
