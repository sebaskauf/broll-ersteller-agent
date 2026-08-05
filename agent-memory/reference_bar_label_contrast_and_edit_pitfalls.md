---
name: bar-label-contrast-and-edit-pitfalls
description: Prozent-Label auf Balken braucht Kontrast-Fallback wenn Fill den Text nicht erreicht; erfundene Zahlen selbst abfangen (qualitative Labels statt Fake-Stats); Edit-Tool kann bei nbsp-verseuchten Strings hartnäckig failen → Python-Zeilen-Fix. Tag 171.
metadata:
  type: feedback
---

# Drei Lessons aus Tag 171 (Opus 5 vs. Fable 5)

## 1. Prozent-Label auf Fortschrittsbalken: Kontrast nicht an Fill-Farbe koppeln
Wenn ein `.pct`-Label rechtsbündig IM Track sitzt (nicht am Fill-Ende), aber der Fill-Wert klein/mittel ist (z.B. 43%), landet das Label im UNBEFÜLLTEN hellen Bereich — nicht auf der Fill-Farbe. Weiße Schrift (gedacht für "Text auf farbigem Fill") wird dort fast unlesbar (weiß auf hellbeige). Fix: Label-Farbe IMMER an den Track-Hintergrund koppeln (gedämpftes Dunkel wie `#5A554C`/`#B85939`), NICHT an die Fill-Farbe — außer der Fill deckt garantiert >90% ab. Beim Augencheck gezielt auf einen Full-Res-Crop der Zahl/des Labels zoomen, nicht nur das Kontaktblatt-Thumbnail ansehen (dort fällt genau sowas nicht auf).

## 2. Erfundene Zahlen selbst abfangen (nicht nur bei fehlender Recherche)
Beim Bau einer "doppelt so lange nutzbar"-Metapher hätte ich fast "14 Tage" / "28 Tage" als Zähler-Ticker eingebaut — plausibel klingende, aber komplett erfundene Zahlen (Anthropic hat keine Tage-Angabe veröffentlicht). Die Regel "niemals Zahlen erfinden" gilt nicht nur wenn man aktiv nach einer Zahl sucht und keine findet — sie gilt auch rückwirkend beim Selbst-Review des eigenen Entwurfs. Fix angewendet: Ticker-Zahlen durch qualitative Text-Labels ersetzt ("NACH HALBER ZEIT LEER" / "REICHT DEN GANZEN MONAT"), Balkenfüllung bleibt als reines proportionales Visual (50% vs. 100%) ohne konkrete Fake-Einheit.

## 3. Edit-Tool kann bei nbsp-kontaminierten Strings hartnäckig "not found" werfen
Ein mehrzeiliger `old_string` mit ` Tage nutzbar` (normales Leerzeichen im Editor-Buffer getippt) matchte wiederholt nicht gegen die Datei — Ursache: die Datei enthielt an der Stelle U+00A0 (No-Break-Space) statt normalem Space (0x20), vermutlich durch Autokorrektur beim ursprünglichen Schreiben reingerutscht. `od -c` auf die betroffene Zeile zeigt `302 240` (UTF-8 für U+00A0) statt eines einfachen Space-Bytes. Diagnose: wenn ein Edit mit augenscheinlich exakt kopiertem String wiederholt fehlschlägt, NICHT stur denselben String erneut versuchen — `grep -n "<eindeutiges Fragment>" datei | od -c` prüfen. Fix: kleinere, eindeutigere Snippets probieren; wenn das auch scheitert, Python-Skript mit zeilenweisem Ersetzen (`if "eindeutiger substring" in line`) statt exaktem Block-Match — umgeht das Whitespace-Problem zuverlässig.
