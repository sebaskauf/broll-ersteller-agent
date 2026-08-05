---
name: light-backgrounds-only
description: Tag 150 korrigiert — B-Roll-BGs IMMER hell (weiß/cream #FAF9F5), NIE dunkle Full-Frame-BGs, auch kein Sage-Desktop. Dunkel nur als Karten/Terminals auf hellem Grund.
metadata:
  type: feedback
---

# B-Roll-Hintergründe: immer hell (weiß/cream), nie dark

Tag 150 (04.07.2026): Set mit 3 dunklen BGs (#262624/#141413) + 1 Sage (#CDD5C0) geliefert. Sebastian: "Die B-Rolls sind okay, Animationen alle super — aber das ist nicht in unserem Stil. Verändere die Hintergrundfarbe zu unserem Stil, den wir immer haben."

**Why:** Sein etablierter Look (GrillMe, Finance, Headroom — alle gefeiert) ist durchgehend hell: weißer oder Cream-BG (#FAF9F5/#F0EEE6). Die offizielle Claude-Twitter-DNA (Sage-Desktop, Dark-Terminal-Full-Frame) ist NICHT automatisch sein Stil — seine eigene Palette schlägt die Anthropic-Referenz-Optik. Dark-Mode-Szenen brechen die Konsistenz seiner Videos.

**How to apply:**
- Full-Frame-BG IMMER #FAF9F5 oder #F0EEE6 (+ dezente handgezeichnete Cream-Textur).
- Dunkle Flächen NUR als Elemente AUF hellem Grund: Terminal-Karten, Chips, Display-Panels, schwarze Pills (#262624/#141413 mit Schatten) — das ist erwünscht und Teil des Looks.
- Weiße Cards auf Cream: mit `border:1px solid #E8E4DA` + warmem Schatten `rgba(60,50,35,.3)` abheben.
- Beim Umfärben dark→hell prüfen: helle Texte/Elemente (#FAF9F5-Chips, helle Grautöne #9C968A) werden unsichtbar → auf Ink/#8A8578 drehen; weiße Twinkles/Deko einfärben.
- Pipeline-Nebenpunkt: Er erwartet tendenziell die Remotion-Pipeline als Default ("warum HyperFrames... aber nicht so schlimm") — HyperFrames ist akzeptiert, solange der Stil stimmt. Stil > Pipeline.

Verwandt: [[grillme-quality-benchmark]], [[reference_realistic_mockup_replicas]], [[hyperframes-multi-comp-batch]]
