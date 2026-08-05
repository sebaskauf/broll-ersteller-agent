#!/usr/bin/env bash
# Installiert den B-Roll-Ersteller-Agent für Claude Code.
# Nicht-destruktiv: bestehende Dateien werden vorher mit Timestamp gesichert.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
AGENT_FILE="$HOME/.claude/agents/broll-ersteller.md"
MEM_DIR="$HOME/.claude/agent-memory/broll-ersteller"
TPL_DIR="$HOME/Documents/Projects/broll-set-template"
TS="$(date +%Y%m%d-%H%M%S)"

backup() {
  if [ -e "$1" ]; then
    mv "$1" "$1.bak-$TS"
    echo "  Backup: $1.bak-$TS"
  fi
}

echo "==> B-Roll-Ersteller-Agent installieren"

# 1. Agent-Definition
mkdir -p "$(dirname "$AGENT_FILE")"
backup "$AGENT_FILE"
cp "$REPO_DIR/agent/broll-ersteller.md" "$AGENT_FILE"
echo "✓ Agent: $AGENT_FILE"

# 2. Agent-Memory (Stil-Patterns aus vielen Feedback-Runden)
mkdir -p "$(dirname "$MEM_DIR")"
backup "$MEM_DIR"
cp -R "$REPO_DIR/agent-memory" "$MEM_DIR"
echo "✓ Memory: $MEM_DIR"

# 3. Template-Kit (Master-Template + Checkliste + Beispiele + Assets)
mkdir -p "$(dirname "$TPL_DIR")"
backup "$TPL_DIR"
cp -R "$REPO_DIR/template" "$TPL_DIR"
echo "✓ Template-Kit: $TPL_DIR"

echo ""
echo "==> Fertig. Nächste Schritte:"
echo "  1. npx --yes hyperframes skills   # HyperFrames+GSAP-Skills für Claude Code installieren"
echo "  2. npx --yes hyperframes doctor   # Render-Umgebung prüfen (Chrome, ffmpeg)"
echo "  3. Claude Code neu starten, damit Agent + Skills geladen werden"
echo "  4. Test: 'B-Roll für dieses Skript: ...' — der Agent triggert automatisch"
