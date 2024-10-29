#!/bin/bash

# ベースディレクトリを指定
BASE_DIR="."  # 必要に応じて変更してください

# .tex ファイルを再帰的に検索し、1行目を置換
find "$BASE_DIR" -type f -name "*.tex" | while read -r file; do
  # ファイルの1行目を \documentclass{report} に書き換え
  sed -i '1s|.*|\\documentclass{report}|' "$file"
  echo "Updated $file"
done
