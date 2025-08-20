#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PROJECT_NAME="bgf-workshop"
VENV_DIR="venv"
REQUIREMENTS_FILE="requirements.txt"

echo -e "${GREEN}📓 Setting up notebook development environment...${NC}"

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
if ! python -c "import ipykernel, numpy, pandas" &> /dev/null; then
    echo -e "${YELLOW}📋 Installing requirements...${NC}"
    pip install -r "$REQUIREMENTS_FILE"
else
    echo -e "${GREEN}✅ Requirements already installed${NC}"
fi

# Set up Jupyter kernel for VS Code/Windsurf
KERNEL_EXISTS=$(jupyter kernelspec list 2>/dev/null | grep "$PROJECT_NAME" || true)
if [ -z "$KERNEL_EXISTS" ]; then
    echo -e "${YELLOW}🧠 Setting up Jupyter kernel for VS Code/Windsurf...${NC}"
    python -m ipykernel install --user --name="$PROJECT_NAME" --display-name="$PROJECT_NAME"
else
    echo -e "${GREEN}✅ Jupyter kernel already configured${NC}"
fi

# Create ipynb directory if it doesn't exist
if [ ! -d "ipynb" ]; then
    echo -e "${YELLOW}📁 Creating ipynb directory...${NC}"
    mkdir ipynb
fi

echo -e "${GREEN}✅ Notebook environment ready!${NC}"
echo -e "${BLUE}📁 Notebooks folder: ./ipynb/${NC}"
echo -e "${BLUE}🐍 Python interpreter: $(which python)${NC}"
echo -e "${BLUE}🧠 Kernel name: $PROJECT_NAME${NC}"
echo ""
echo -e "${YELLOW}💡 In VS Code/Windsurf:${NC}"
echo -e "  1. Open a .ipynb file in the ipynb/ folder"
echo -e "  2. Select kernel: '$PROJECT_NAME' (top-right)"
echo -e "  3. Or set Python interpreter: $(realpath $VENV_DIR/bin/python)"