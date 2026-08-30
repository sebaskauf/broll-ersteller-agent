# Setup-Prompt

Diesen Prompt komplett kopieren und in Claude Code pasten. Claude installiert alles und richtet den Agenten dann per Interview auf DICH ein — dein Stil, nicht der von irgendwem anderem.

---

Installiere mir den B-Roll-Ersteller-Agent aus diesem Repo und richte ihn auf MICH ein: https://github.com/sebaskauf/broll-ersteller-agent

SCHRITT 1 - INSTALLIEREN
1. `git clone https://github.com/sebaskauf/broll-ersteller-agent.git ~/Documents/Projects/broll-ersteller-agent` (falls der Ordner schon existiert: dort `git pull` statt clone).
2. Führ `./install.sh` im Repo aus. Das Script kopiert die Agent-Definition nach `~/.claude/agents/`, das Starter-Memory nach `~/.claude/agent-memory/broll-ersteller/` und das Template-Kit nach `~/Documents/Projects/broll-set-template/`. Bestehende Dateien werden automatisch mit Timestamp gesichert.
3. Voraussetzungen prüfen und ggf. installieren: Node >= 18 (`node --version`) und ffmpeg (`ffmpeg -version`). Fehlt Node, führ mich zuerst durch die Installation, bevor du weitermachst. Danach `npx --yes hyperframes skills` (installiert die HyperFrames- und GSAP-Skills für Claude Code) und `npx --yes hyperframes doctor` (prüft die Render-Umgebung, installiert bei Bedarf den Headless-Browser).

SCHRITT 2 - AUF MICH EINRICHTEN (das Interview)
Der Agent soll sich individuell auf mich einstellen, nicht auf seinen Ersteller. Lies die installierte Agent-Datei (Abschnitt "Setup-Modus") und führe das Interview jetzt selbst mit mir durch, EINE Frage nach der anderen. Die Antworten legst du als `~/Documents/Projects/broll-set-template/stil.md` ab (Vorlage: `stil.md.example` daneben), die ab dann für alle B-Rolls gilt:

DESIGN
- meine 2 bis 3 Markenfarben (wenn ich keine habe, hilf mir welche zu finden, die zu mir passen)
- hell oder dunkel, Schriftgefühl (technisch, editorial, verspielt), 1 bis 2 Beispiele, deren Look mir gefällt

DER INHALT
- was für Videos ich mache, meine Themen, meine Zielgruppe
- was NIE in meinen B-Rolls auftauchen soll: Stile, Farben, Elemente, Wörter

DAS FORMAT
- Hoch- oder Querformat, und dass Wichtiges in die Bildmitte gehört (beim Schnitt wird gezoomt)

OPTIONAL
- ob ich Higgsfield nutze (dann kann der Agent zusätzlich fotorealistische Cover-Bilder für mich erzeugen; ohne Higgsfield läuft alles andere komplett kostenlos)

Stell so viele Rückfragen wie nötig - lieber eine Frage mehr als ein generischer Look. Wenn ich "weiß nicht" sage, gib mir 2 bis 3 Vorschläge zur Auswahl, statt es offen zu lassen.

SCHRITT 3 - BEWEIS
Bau EIN Test-B-Roll, 5 Sekunden, in meinem neuen Stil (kompletter Ablauf aus der Agent-Datei inkl. Lint-Check und Augencheck), und öffne es mir. Erst wenn ich den Look abgenickt habe, ist das Setup fertig. Was ich ändern will, schreibst du direkt in die `stil.md`.

Sag mir zum Schluss, dass ich Claude Code einmal neu starten soll, und wie ich den Agenten ab dann benutze: Video-Skript geben und sagen, für welche nummerierten Stellen ich B-Roll will (z.B. "B-Roll für diese 3 Stellen: 1. ... 2. ... 3. ..."). Er triggert automatisch auf "b-roll"/"visuals"/"footage" und liefert fertige MP4s.

Wichtig: Nichts löschen oder überschreiben ohne Backup. Wenn ein Schritt fehlschlägt, sag mir was fehlt, statt es als erledigt zu melden.

---
