#!/usr/bin/env bash
set -euo pipefail

# Cursor Starter Kit - Setup Script
# Usage:
#   bash setup.sh [template] [source] [project-name]
# Example:
#   bash setup.sh universal . my-new-project

TEMPLATE=${1:-universal}
SOURCE=${2:-.}
NAME=${3:-new-app}

echo "🎨 Creating project '$NAME' from template '$TEMPLATE'..."

# Basic structure
mkdir -p "$NAME"/{src/{core,modules,shared},docs,scripts,tests,templates,.devcontainer}

# Copy local templates if available (when running from repo clone)
if [ -d "$SOURCE/templates" ]; then
  cp -r "$SOURCE/templates" "$NAME/templates" || true
fi

# Pull templates from GitHub raw if not present locally
RAW_BASE="https://raw.githubusercontent.com/San-quan/cursor-starter-kit/main"
curl -fsSL "$RAW_BASE/templates/$TEMPLATE.rules" -o "$NAME/.cursorrules" || echo "# no rules found for $TEMPLATE" > "$NAME/.cursorrules"
curl -fsSL "$RAW_BASE/.devcontainer/devcontainer.json" -o "$NAME/.devcontainer/devcontainer.json" || true

# Optional helper files
cat > "$NAME/README.md" <<EOF
# $NAME

Generated from cursor-starter-kit template: $TEMPLATE
EOF

echo "✅ Project '$NAME' created. Rules written to $NAME/.cursorrules"
echo "Next steps:"
echo "  cd $NAME"
echo "  # 查看并编辑 .cursorrules，然后开始开发"