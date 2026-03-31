#!/bin/bash
# ==============================================================================
# push.sh - Simple helper script for pushing changes to r-curriculum
# 
# Usage:
#   ./push.sh                    # Uses default commit message
#   ./push.sh "Add Script 08"    # Uses custom commit message
# ==============================================================================

echo "=== r-curriculum Push Helper ==="

# Check if we're in the right directory
if [ ! -f "r-curriculum-overview.qmd" ]; then
  echo "❌ Error: Please run this script from the project root (r-curriculum folder)"
  exit 1
fi

# Get commit message (use argument if provided, otherwise default)
if [ -n "$1" ]; then
  COMMIT_MSG="$1"
else
  COMMIT_MSG="Update curriculum (scripts, overview, or README)"
fi

echo "📂 Staging all changes..."
git add .

echo "📝 Committing with message: '$COMMIT_MSG'"
git commit -m "$COMMIT_MSG"

if [ $? -eq 0 ]; then
  echo "🚀 Pushing to GitHub..."
  git push
  
  if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
  else
    echo "❌ Push failed"
  fi
else
  echo "⚠️  Nothing to commit (no changes detected)"
fi

echo "=== Done ==="
