---
name: feedback-exact-part-mapping
description: Wenn Sebastian nummerierte Skript-Teile für B-Roll nennt, exakt 1:1 mappen — kein Hook/CTA dazuerfinden, gesplittete Sätze als getrennte Beats erkennen
metadata:
  type: feedback
---

Wenn Sebastian B-Roll für **nummerierte Skript-Teile** anfordert, baust du GENAU einen Beat pro genanntem Teil — in exakter Reihenfolge, B-Roll 1 = Teil 1.

**Why:** Tag 132 (Fable-5-Comeback-Plugin) ist mir das 2x falsch gelaufen. Sebastian war sauer: "Das erste B-Roll, das du mir erstellt hast, ist nicht für den Teil, den ich wollte." Zwei konkrete Fehler:
1. **Hook als Beat 1 gebaut, obwohl er kein Hook-B-Roll wollte.** Sein "Erstens" war der erste INHALTS-Satz ("Fable 5 ist das stärkste ABER teuerste"), NICHT der Hook ("Anthropic hat bestätigt..."). Der Hook-Satz im Skript zählt NICHT automatisch als Teil 1.
2. **Zwei Zahlen-Aussagen in EINEN Beat gepackt.** Skript-Satz "90% weniger Code UND 77% Token" hat Sebastian als ZWEI Teile gezählt (Fünftens = 90% Code, Sechstens = 77% Token). Deshalb kam er auf "sieben" obwohl der Fließtext nach 6 Sätzen aussieht.

**How to apply:**
- Zähl die genannten Teile EXAKT durch. Wenn die Gesamtzahl ("die sieben") nicht zur Satzzahl passt → ein Satz wird gesplittet (oft: zwei Zahlen/Claims in einem Satz = zwei Beats). Lös den Widerspruch auf, BEVOR du baust.
- Hook und CTA NUR als eigenen Beat bauen, wenn Sebastian sie explizit in die nummerierte Liste aufnimmt. Sonst weglassen.
- Im Report immer eine Mapping-Tabelle "B-Roll N → Skript-Teil N" zeigen, damit das Mapping verifizierbar ist.
- Dateinamen an die Teil-Nummer koppeln (FableR-01-..., FableR-02-...).
- Bei fließend gesprochenem Skript (kein "Erstens/Zweitens" im Voiceover): KEINE sichtbare Nummer ins Video — die Nummerierung ist nur das Mapping-Tool für dich. Siehe [[workflow_broll_creation]].

Verwandt: [[feedback_exact_parts_direct_execution]] (nummerierte Teile = exakte Comp-Anzahl, direkt bauen).
