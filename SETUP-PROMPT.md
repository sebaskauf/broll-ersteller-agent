# Setup-Prompt

Diesen Prompt komplett kopieren und in Claude Code pasten — Claude installiert dann alles selbst:

---

Installiere mir den B-Roll-Ersteller-Agent aus diesem Repo: https://github.com/sebaskauf/broll-ersteller-agent

Gehe genau so vor:

1. **Klonen:** `git clone https://github.com/sebaskauf/broll-ersteller-agent.git ~/Documents/Projects/broll-ersteller-agent` (falls der Ordner schon existiert: `git pull` statt clone).
2. **Installieren:** Führe `./install.sh` im Repo aus. Das Script kopiert die Agent-Definition nach `~/.claude/agents/`, das Starter-Memory nach `~/.claude/agent-memory/broll-ersteller/` und das Template-Kit nach `~/Documents/Projects/broll-set-template/`. Es sichert bestehende Dateien automatisch mit Timestamp — nichts wird ohne Backup überschrieben.
3. **Voraussetzungen prüfen und ggf. installieren:** Node ≥ 18 (`node --version`) und ffmpeg (`ffmpeg -version`, sonst `brew install ffmpeg`). Danach `npx --yes hyperframes skills` (installiert die HyperFrames- und GSAP-Skills für Claude Code) und `npx --yes hyperframes doctor` (prüft die Render-Umgebung, installiert bei Bedarf den Headless-Browser).
4. **Verifizieren:** Rendere das Beispiel: `cd ~/Documents/Projects/broll-set-template/examples && npx --yes hyperframes render 01-gedaechtnis-voll --quality high --output test.mp4`. Extrahiere danach mit ffmpeg einen Frame aus der MP4 (z.B. Frame 145) als PNG und schau ihn dir mit dem Read-Tool an — er muss eine fertige, helle Grafik im Cream/Coral-Stil zeigen, nicht leer sein. Melde mir das Ergebnis ehrlich.
5. **Erklär mir zum Schluss kurz die Benutzung:** Claude Code neu starten, dann in einer neuen Session mein Video-Skript geben und sagen, für welche nummerierten Stellen ich B-Roll will (z.B. "B-Roll für diese 3 Stellen: 1. … 2. … 3. …"). Der Agent `broll-ersteller` triggert automatisch auf "b-roll"/"visuals"/"footage" und liefert fertige MP4s.

Wichtig: Nichts löschen oder überschreiben ohne Backup. Wenn ein Schritt fehlschlägt, sag mir was fehlt statt es als erledigt zu melden.

---
