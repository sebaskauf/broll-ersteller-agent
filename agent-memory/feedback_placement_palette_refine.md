---
name: placement-palette-refine
description: Talking-head glass-overlay placement palette — break L-R-L-R monotony, cull ~40%, split + center-lower sparingly
metadata:
  type: feedback
---

Bei Talking-Head-Glass-Overlays (warm-liquid-glass auf geschnittenes Video) gilt: striktes Links-Rechts-Links-Rechts wirkt mechanisch/nervig und zu viele Overlays wirken "KI-generiert".

**Regel:**
- Cullen auf ~40% weniger Beats. Lange Videos (~8 Min) → 6-8 Beats. Nur behalten wo WESENTLICH + Visual-Mehrwert. Im Zweifel weg. Decorative Callouts ("Tipp vom Gründer", "Lass Cloud Code ran") und Beats die nur nachplappern → raus. Redundante Flow-Diagramme (zwei Beats die denselben Ablauf zeigen) → einen behalten.
- Platzierungs-Palette MISCHEN, kein erkennbares Muster: `left` (x40-650), `right` (x1270-1880), `center-lower` (slim Lower-Third unter Kinn, y712-930, height ~130-190px), `split` (zwei Karten L+R gleichzeitig, Gesicht in Mitte frei).
- `center-lower` + `split` je max 1-2x pro Video.
- Gesicht/Oberkörper x0.36-0.64 IMMER frei (außer slim center-lower über Brust).
- Echte 2-Wege-Vergleiche ("Global vs Projekt", "Pro vs Max") → `split` statt einer Karte mit zwei Sub-Cards.

**Why:** Sebastian's direkte Kritik nach Render-Runde 1 (2026-05-30): Rhythmus zu monoton + zu viele unnötige Overlays.

**How to apply:** Bei jedem Talking-Head-Refinement. Beispiel-Sequenz die funktioniert hat (Video 0529_1, 7 Beats): left, left, right, split, center-lower, right, left. 2x gleiche Seite hintereinander ist bewusst ok.

**Technik split:** EIN Overlay-HTML mit zwei `.glass`-Containern (`.l` left:60px, `.r` right:60px), gleiche top-y, gleiches `window.__seek` staggert beide (cardIn rechts ~0.45s nach links). Render-Pfad bleibt identisch (render_beat.py über echten bg).

**Technik center-lower:** glass auf left~600 width~720 top~756, `.pad` als flex row (eyebrow | bigwrap | word inline), height auto, slim. WICHTIG: Inhalt minimal halten (Number + 2-Wort-Label), KEINE langen Kicker reinquetschen — die werden an den Kartenrändern abgeschnitten/unleserlich. Erst breit + wenig Text, dann passt es.

Siehe [[workflow_broll_creation]].
