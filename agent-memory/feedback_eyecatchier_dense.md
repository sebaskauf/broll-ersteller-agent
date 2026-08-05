---
name: eyecatchier-dense-brolls
description: B-Rolls müssen visuell knallen — dicht, dramatisch, viel Bewegung. NICHT nur 3 statische Cards oder ein einzelner Balken. Trotzdem im UI-Mockup-Stil bleiben.
metadata:
  type: feedback
---

# B-Rolls müssen eyecatchier sein — Dichte & Drama statt Minimal

Sebastian am 29.05.2026 (Tag 114): "Die B-Rolls die du erstellt hast sind auch ein bisschen langweilig... macht das bisschen eyecatchier... allgemein die ganzen B-Rolls bisschen eyecatchier. Nicht nur so drei Cards, nicht nur so einen Balken, sondern alles ein bisschen cooler."

**Why:** Für TikTok/Reels muss jedes B-Roll im ersten Moment fesseln. Minimalistische "3 Cards nebeneinander" oder "ein Progress-Balken" lesen sich als langweilig/leer. Bei einem Beat wie "bis zu 1.000 Agents" erwartet er, dass die 1.000 auch wirklich krass dargestellt werden (dichter Swarm), nicht ein nüchterner Counter mit 50 Kacheln.

**How to apply — bei JEDER Composition:**
- **Dichte statt Sparsamkeit:** Wenn von vielen Elementen die Rede ist (1.000 Agents), zeig hunderte Nodes als dichten Swarm, nicht ein Dutzend Kacheln.
- **WICHTIG — Terminals/Panels IMMER WEISS.** Am 29.05. machte ich die Swarm-Panels dunkel (#0E1117) "damit Neon-Nodes knallen" → Sebastian explizit abgelehnt: "Warum hast du es schwarz gemacht? Lass das Terminal so wie vorher vom Design her... weißes Terminal für alle ist schon besser." Eyecatchy kommt NICHT aus dunklem BG, sondern aus Dichte/Motion/Glow. Agent-Node-Farben kontrast-stark wählen (blue/purple/green/orange, kein helles Cyan #22D3EE → nutze #0EA5E9) damit sie auf Weiß lesbar sind.
- **Layered motion:** fließende Partikel entlang Connection-Lines, Energy-/Shockwave-Rings, Aktivitäts-Wellen die über den Swarm laufen, Glow-Pulse.
- **Layout-Check:** Fixed-Width-Inhalt (z.B. 1080px Swarm) in einem 100%-WindowChrome-Body braucht `margin: "0 auto"`, sonst sitzt er links statt mittig und ragt/schneidet ab. Inhalts-Höhe muss in die Panel-Höhe passen (Kreis-Layouts: R + Node-Radius < halbe Panel-Höhe).
- **Cards müssen LEBEN:** statt statischer Card mit Icon → Mini-Animation drin (Code-Zeilen scrollen, Bug wird weggepoppt, Radar-Sweep), Agent-Dots die drumherum buzzen.
- **Dramatische Zahlen/Badges:** große Counter mit Glow, Badges die mit scale-overshoot + Shockwave reinslammen (z.B. "20×").
- **Statt ein Balken:** ein Race/Wettlauf mit Speed-Lines, Trails, Echo-Dots — Bewegung die erzählt.
- Trotzdem: WindowChrome, SectionLabel, PulseDot, Status-Pill als Signatur behalten (siehe [[real-style-ui-mockups]]). Eyecatchy heißt NICHT abstrakt-organisch werden — die verbotenen Anti-Patterns gelten weiter.

## KEIN Copy-Paste-Set: jede Comp eigene Metapher

Am 30.05. (Tag 116) baute ich Comp 08/09/10/11 alle mit dem GLEICHEN `ObsidianGraph`-Component, nur andere Props (t0/scale/crossDelay) → Sebastian: "Du hast viermal fast eins zu eins das gleiche B-Roll erstellt. Auf gar keinen Fall. Viel individueller und kreativer. Es geht nicht, dass alles gleich ist und nur eine Sache verändert wird."

**Why:** 4 fast identische Clips hintereinander wirken faul und langweilig im Schnitt. Ein wiederverwendbares Hero-Motiv (z.B. der Graph) ist okay — aber MAX 1x als der eine Moment, nicht 4x mit Param-Tuning.

**How to apply:** Pro Beat eine EIGENE visuelle Metapher wählen. Beim Second-Brain-Set gelöst als: 08 = Vault-Filetree der sich aufbaut (Ordner/Files streamen + Build-Log), 09 = 3 Karten-Spalten mit kaskadierenden Note-Cards + Counter, 10 = Wikilink-Nahaufnahme (zentrale Notiz mit `[[links]]` → verbundene Cards + Backlinks), 11 = Hero-Graph mit Stats-HUD + Stempel (der EINE Graph-Moment). Wenn ich merke "ich rendere dieselbe Component nochmal mit anderem Prop" → STOP, neue Metapher bauen.

## Auch wichtig (gleiche Session)
Beats die Sebastian getrennt nummeriert = getrennte Comps. Er hatte "überprüfen sich gegenseitig" und "korrigieren eigene Fehler vor Ausgabe" als 2 Teile genannt, ich hatte sie zu 1 Comp zusammengelegt → Fehler. Siehe [[exact-parts-direct-execution]].

## Related
- [[real-style-ui-mockups]]
- [[exact-parts-direct-execution]]
- [[5sec-min-continuous-motion]]
