---
name: keine-verifikations-loops
description: Sebastian will EINEN sauberen Durchlauf statt vieler Verifikations-Runden — bauen, einmal prüfen, liefern. Nachfragen nur bei echten Informationslücken. 02.08.
metadata:
  type: feedback
---

# „Keine 100 Verifizierungs-Loops" (02.08., Tag 179)

**Regel:** Sebastian will EINEN sauberen Durchlauf: bauen → einmal QA (lint/check) → rendern →
einmal Kontaktblatt anschauen → liefern. Nicht mehrfach dieselbe Sache absichern, nicht nach
jedem Schritt zwischenmelden, nicht um Bestätigung bitten.

**Why:** Wörtlich: „Du brauchst nicht 100 Mal zu verifizieren, dass es auch richtig ist und du
brauchst nicht 100 Mal Verifizierungs-Loops drin haben, ich brauch einfach nur das Ganze optimal
erstellt." Die Schleifen kosten ihn Wartezeit ohne sichtbaren Mehrwert — das Ergebnis zählt.

**How to apply:**
- Der Ablauf aus dem Agent-File bleibt vollständig gültig — er ist EIN Durchlauf, kein Loop.
  QA-Gate und Augencheck NICHT weglassen (sie fangen echte Fehler, siehe unten), aber jeweils
  genau einmal, gebündelt über alle Beats.
- Fehler, die der eine Check findet, direkt fixen und nur die betroffenen Beats neu rendern —
  danach nicht nochmal komplett durchprüfen.
- Nicht zwischendurch Statusmeldungen schicken. Erst melden, wenn die MP4s liegen.

**Ausnahme — echte Informationslücke ist KEIN Loop:** Wenn eine Angabe fehlt, die ich nicht
erfinden darf (Produktname, Install-Befehl, Zahl), einmal kurz fragen — mit recherchierten
Optionen zum Anklicken, nicht offen. Bei Tag 179 nannte das Skript kein Plugin; eine Frage
(„Agent Reach") hat 6 B-Rolls mit falschem Namen verhindert. Das deckt sich mit seiner
CLAUDE.md („Bei Unsicherheit: fragen statt raten") und widerspricht dem Loop-Feedback nicht.

**Der Augencheck bleibt Pflicht** — er hat auch bei Tag 179 wieder zwei Dinge gefunden, die
lint/check nicht sehen konnten: ein Tausender-Formatter, der nur EINEN Punkt setzt
(`2139.997` statt `2.139.997` — die verbreitete Kurzfassung bricht ab 7 Stellen, korrekt ist
eine `while`-Schleife), und Layout-Stapelfehler. Siehe [[gsap-fromto-immediate-and-inline-spans]].
