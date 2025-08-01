#!/bin/bash

# Nord Theme Installer
# Installs the latest version of the Nord theme for GitHub Pages

set -e  # Exit on any error

echo "🎨 Nord Theme Installer"
echo "======================="

# Check if we have required tools
if ! command -v curl &> /dev/null; then
    echo "❌ Error: curl is required but not installed."
    exit 1
fi

# Get the GitHub repository info
REPO_OWNER="cglass"
REPO_NAME="styles"
API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest"

echo "📡 Fetching latest release information..."

# Get latest release tag
LATEST_RELEASE=$(curl -s "$API_URL")
if [ $? -ne 0 ]; then
    echo "❌ Error: Failed to fetch release information from GitHub API"
    exit 1
fi

TAG_NAME=$(echo "$LATEST_RELEASE" | grep '"tag_name":' | sed -E 's/.*"tag_name":[[:space:]]*"([^"]+)".*/\1/')

if [ -z "$TAG_NAME" ]; then
    echo "❌ Error: Could not determine latest release version"
    exit 1
fi

echo "✅ Latest version: $TAG_NAME"

# Detect project type and suggest directory
CSS_DIR="css"
if [ -d "assets" ]; then
    CSS_DIR="assets/css"
elif [ -d "_sass" ]; then
    CSS_DIR="_sass"
elif [ -d "static/css" ]; then
    CSS_DIR="static/css"
elif [ -d "public" ]; then
    CSS_DIR="public"
fi

# Prompt for CSS directory
echo ""
echo "📁 Where should the CSS file be installed?"
read -p "CSS directory [$CSS_DIR]: " USER_CSS_DIR
CSS_DIR=${USER_CSS_DIR:-$CSS_DIR}

# Create CSS directory if it doesn't exist
if [ ! -d "$CSS_DIR" ]; then
    echo "📂 Creating directory: $CSS_DIR"
    mkdir -p "$CSS_DIR"
fi

# Prompt for HTML file installation
INSTALL_HTML="y"
if [ -f "index.html" ]; then
    echo ""
    echo "⚠️  index.html already exists in current directory"
    read -p "Replace with Nord theme template? (y/N): " INSTALL_HTML
    INSTALL_HTML=${INSTALL_HTML:-n}
fi

echo ""
echo "⬇️  Downloading files..."

# Download CSS file
CSS_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/download/$TAG_NAME/styles.min.css"
echo "   • Downloading styles.min.css..."
if curl -L -f -o "$CSS_DIR/styles.min.css" "$CSS_URL"; then
    echo "   ✅ styles.min.css saved to $CSS_DIR/"
else
    echo "   ❌ Failed to download styles.min.css"
    exit 1
fi

# Download HTML template if requested
if [[ "$INSTALL_HTML" =~ ^[Yy]$ ]]; then
    HTML_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/download/$TAG_NAME/githubpages.html"
    echo "   • Downloading HTML template..."
    if curl -L -f -o "index.html" "$HTML_URL"; then
        # Update CSS path in HTML file to match where we installed it
        CSS_PATH="$CSS_DIR/styles.min.css"
        echo "   • Updating CSS path to $CSS_PATH..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            sed -i '' "s|css/styles\.min\.css|$CSS_PATH|g" index.html
        else
            # Linux
            sed -i "s|css/styles\.min\.css|$CSS_PATH|g" index.html
        fi
        echo "   ✅ index.html created with correct CSS path"
    else
        echo "   ❌ Failed to download HTML template"
        exit 1
    fi
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Customize index.html with your content"
echo "   2. Update the page title and header text"
echo "   3. Replace placeholder content with your own"
echo ""
echo "🔗 Links:"
echo "   • Style guide: https://styles.chrisglass.dev"
echo "   • Documentation: https://github.com/$REPO_OWNER/$REPO_NAME"
echo ""
echo "💡 The theme includes automatic light/dark mode switching!"
echo "   Toggle with the button in the header or it follows system preference."