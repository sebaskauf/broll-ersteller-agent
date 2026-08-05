---
name: no-emojis-drawn-visuals
description: Tag 143 hart abgelehnt — KEINE Emojis als Visual, stattdessen echte gezeichnete SVG/CSS-Metaphern die über die vollen 5s erzählen. Plus 1-Ordner-pro-Satz wenn gefordert.
metadata:
  type: feedback
---

# Keine Emojis — echte gezeichnete Visuals, eine Metapher über die vollen 5s

Sebastian hat das erste Safe-Settings-Set (Tag 143) als **"insgesamt sehr, sehr schlecht"** abgelehnt. Zwei harte Lektionen:

**Why:** Ich hatte Beats mit vielen Emojis gebaut (🛡️ 🔒 💥 ⚡ 🗑️ 😌 😰 🚫 ⏱️ 📁 📄) und die Animation war "Emoji + irgendwas wackelt". Das wirkt billig/faul und ist NICHT das, was er unter kreativ/dicht versteht. Wörtlich: *"Ich will nicht, dass du viele Emojis nutzt. Du nutzt immer so viele Emojis. Nutze doch bitte visuelle Darstellungen, die zeigen, was passiert."* + *"Warum kannst du es nicht visuell viel mehr kreativ darstellen, was ich sage? Viel mehr soll zu sehen sein."*

**How to apply:**
- **NIE Emoji-Glyphen als Bild-Inhalt.** Alles als **gezeichnetes SVG/CSS** bauen: Warn-Dreieck (`<path>`-Triangle + Ausrufezeichen), Checkmark (`<path>`), Schild (Crest-`<path>`), Schloss (Bügel-Arc + Body-Rect), Gauge (Semicircle-Arc + rotierende Nadel-Line), DENIED-Stempel (rotierte Border-Box mit Text), Schockwelle (expandierende `<circle>`), einstürzende Struktur (gestapelte Block-Divs mit Gravity-Fall `dy = fp*fp*k` + rotate), Contribution-Wall (Grid-Cells die grün füllen, dann roter Wipe). Reusable Primitive-Set liegt in `SafeSettingsV2BRoll.tsx` (`Warn`, `Check`, `XIco`, `Shield`, `Lock`).
- **Logos sind erlaubt** (Brand-PNG: `claude-logo-combo.png` Spark, `claude-tamagotchi.png`) — das sind keine Emojis.
- **Eine echte Metapher pro Beat, die über die VOLLEN 5s etwas TUT** — nicht ein statisches Objekt das wackelt. Beispiele die funktioniert haben (Tag 143 V2): Projekt = Block-Turm der bei einem roten Schlag einstürzt; "Monate Arbeit" = Contribution-Wall die sich grün füllt und dann in 1 Sek rot weggewischt wird; "kann nicht ausführen" = Befehl tippt → roter Strikethrough → DENIED-Stempel knallt rein; "gesperrt" = rote Command-Tokens fliegen auf ein gezeichnetes Schild und prallen ab; "keine Sorgen" = Risiko-Gauge-Nadel fällt 100%→0%, Indikatoren flippen rot→grün.
- **Mappe seinen Satz wörtlich auf die Metapher.** Er sagt z.B. "soll was zusammenbrechen" → also bricht sichtbar etwas zusammen.

## Lieferform: 1 Ordner pro Teil

Wenn er sagt "öffne neun Ordner, pack die neun geordnet da rein" → **je B-Roll ein eigener nummerierter Unterordner** (`out/tag-N-topic/1-kurzname/`, `2-kurzname/` …), damit er sie in CapCut geordnet reinziehen kann. Nicht alle in einen Ordner werfen.

Verwandt: [[eyecatchier-dense-brolls]], [[grillme-quality-benchmark]], [[broll-5sec-motion]].
