#!/bin/bash
# 3D Reveal Pro — Mac Setup Script
# Run once: bash setup-mac.sh

set -e

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   3D Reveal Pro — Mac Setup          ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Check Python
if ! command -v python3 &>/dev/null; then
  echo "❌  Python 3 not found."
  echo "    Install from: https://www.python.org/downloads/"
  echo "    Or via Homebrew: brew install python3"
  exit 1
fi

PYTHON_VER=$(python3 --version 2>&1)
echo "✓  Found $PYTHON_VER"

# Check pip
if ! python3 -m pip --version &>/dev/null; then
  echo "❌  pip not found. Installing..."
  curl https://bootstrap.pypa.io/get-pip.py | python3
fi

echo ""
echo "→  Creating virtual environment (.venv)..."
python3 -m venv .venv

echo "→  Activating virtual environment..."
source .venv/bin/activate

echo ""
echo "→  Installing dependencies (this may take a few minutes on first run)..."
pip install --upgrade pip --quiet
pip install flask flask-cors transformers torch torchvision pillow

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   ✅  Setup complete!                ║"
echo "╠══════════════════════════════════════╣"
echo "║  To start the depth server, run:     ║"
echo "║    bash start-server-mac.sh          ║"
echo "╚══════════════════════════════════════╝"
echo ""
