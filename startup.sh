#!/bin/bash
# startup.sh - Startup script for development sessions

echo "--------------------------------------------------"
echo "🚀 Starting development session: $(date)"
echo "--------------------------------------------------"

# 1. Pull code from GitHub
echo "📥 Syncing with GitHub..."
git pull origin master

# 2. Read the handover document
if [ -f "HANDOVER.md" ]; then
    echo ""
    echo "📝 [Handover Document found]"
    echo "=================================================="
    cat HANDOVER.md
    echo "=================================================="
else
    echo "⚠️  No HANDOVER.md found. Starting a fresh session."
fi

# 3. Suggest next actions
echo ""
echo "🎯 [Suggested Next Actions]"
if [ -f "tasks.md" ]; then
    echo "Checking tasks.md for unfinished items..."
    grep -E "^- \[ \]" tasks.md || echo "All tasks in tasks.md seem completed! Check README for new goals."
else
    echo "1. Run 'openspec propose' to start a new feature."
    echo "2. Review README.md for project vision."
fi
echo "--------------------------------------------------"
