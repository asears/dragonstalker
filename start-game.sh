#!/bin/bash
echo "========================================"
echo "  DRAGON STALKER - Night Stalker Clone"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    if ! command -v python &> /dev/null; then
        echo "Python not found! Please install Python first."
        exit 1
    fi
    PYTHON_CMD="python"
else
    PYTHON_CMD="python3"
fi

echo "Starting local web server..."
echo ""
echo "Game will be available at: http://localhost:8080"
echo ""
echo "Press Ctrl+C to stop the server"
echo "========================================"
echo ""

cd "$(dirname "$0")"
$PYTHON_CMD -m http.server 8080
