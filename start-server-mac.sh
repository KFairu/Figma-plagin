#!/bin/bash
# 3D Reveal Pro — Start Depth Map Server (Mac)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   3D Reveal Pro — Depth Map Server   ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Use venv if exists, otherwise system python
if [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
  echo "→  Using virtual environment"
else
  echo "→  Using system Python (run setup-mac.sh first for isolated install)"
fi

echo "→  Starting server on http://localhost:5000"
echo "→  First launch downloads the depth model (~200 MB) — please wait"
echo ""
echo "   Keep this window open while using the plugin."
echo "   Press Ctrl+C to stop."
echo ""

python3 server.py
