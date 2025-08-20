#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

VENV_DIR="venv"
REQUIREMENTS_FILE="requirements.txt"

echo -e "${GREEN}🐍 Setting up Python CLI development environment...${NC}"

# Check if we're in the right directory
if [ ! -f "$REQUIREMENTS_FILE" ]; then
    echo -e "${RED}❌ requirements.txt not found. Make sure you're in the project root.${NC}"
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    echo -e "${YELLOW}📦 Creating virtual environment...${NC}"
    python3 -m venv "$VENV_DIR"
fi

# Activate virtual environment
echo -e "${YELLOW}🔧 Activating virtual environment...${NC}"
source "$VENV_DIR/bin/activate"

# Check if requirements are installed
if ! python -c "import requests, pandas, numpy" &> /dev/null; then
    echo -e "${YELLOW}📋 Installing requirements...${NC}"
    pip install -r "$REQUIREMENTS_FILE"
else
    echo -e "${GREEN}✅ Requirements already installed${NC}"
fi

# Create py directory if it doesn't exist
if [ ! -d "py" ]; then
    echo -e "${YELLOW}📁 Creating py directory...${NC}"
    mkdir py
fi

# Change to py directory
cd py

echo -e "${GREEN}✅ Development environment ready!${NC}"
echo -e "${BLUE}📁 You're now in: $(pwd)${NC}"
echo -e "${BLUE}🐍 Python: $(which python)${NC}"
echo -e "${BLUE}💡 Virtual environment is active${NC}"

# If arguments provided, run the script
if [ $# -gt 0 ]; then
    echo -e "${YELLOW}🚀 Running: python $@${NC}"
    python "$@"
else
    echo -e "${YELLOW}💡 Usage examples:${NC}"
    echo -e "  ${BLUE}./py_dev.sh script.py${NC}      # Run a specific script"
    echo -e "  ${BLUE}./py_dev.sh${NC}               # Just set up environment"
    echo ""
    echo -e "${YELLOW}🔧 Starting interactive shell in py/ directory...${NC}"
    exec bash
fi