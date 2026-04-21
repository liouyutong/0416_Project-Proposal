#!/bin/bash
# ending.sh - Wrap-up script for development sessions

echo "--------------------------------------------------"
echo "🏁 Wrapping up development session: $(date)"
echo "--------------------------------------------------"

# 1. Update tasks.md (Basic check)
if [ -f "tasks.md" ]; then
    echo "📊 Task status in tasks.md:"
    grep -E "^- \[.\]" tasks.md
else
    echo "📄 Creating a basic tasks.md..."
    echo "# Project Tasks" > tasks.md
    echo "- [x] Initial setup" >> tasks.md
fi

# 2. Archive the change (Requires OpenSpec)
if command -v openspec &> /dev/null; then
    echo "📦 Checking for completed OpenSpec changes..."
    # This is a placeholder for actual archive logic if the user uses openspec
    # openspec archive --auto (if such flag exists)
fi

# 3. Write handover document
echo "✍️  Generating HANDOVER.md for the next developer..."
cat <<EOF > HANDOVER.md
# 📝 Handover Document - $(date '+%Y-%m-%d %H:%M')

## ✅ 已完成的工作 (Completed)
- 建立了開發流程腳本 (startup.sh, ending.sh)
- 已將專案檔案整理至 GitHub 儲存庫
- 已設置 OpenSpec 編號規則 (01-)

## 🚧 進行中的工作 (In Progress)
- 持續優化 AI 辨識模型說明
- 相關研究對照表維護

## 🎯 下一步建議 (Next Actions)
- [ ] 執行 'openspec.cmd init' 初始化規範開發環境
- [ ] 根據 '相關研究.md' 補充更多實驗數據分析
EOF

# 4. Push code to GitHub
echo "📤 Pushing changes to GitHub..."
git add .
git commit -m "Dev session wrap-up: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin master

echo "--------------------------------------------------"
echo "✅ Wrap-up complete! See you next time."
echo "--------------------------------------------------"
