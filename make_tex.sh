#!/bin/bash

# 探索するベースディレクトリを指定
BASE_DIR="."  # 必要に応じて変更してください

# 指定したディレクトリ内を再帰的に探索
find "$BASE_DIR" -type d | while read -r dir; do
  # 子ディレクトリがないか確認
  if [ -z "$(find "$dir" -mindepth 1 -maxdepth 1 -type d)" ]; then
    # main.texが存在しないか確認
    if [ ! -f "$dir/main.tex" ]; then
      # main.texファイルを生成
      echo "\documentclass{standalone}" > "$dir/main.tex"
      echo "\input{../../../head.tex}" >> "$dir/main.tex"
      echo "\begin{document}" >> "$dir/main.tex"
      echo "" >> "$dir/main.tex"
      echo "\end{document}" >> "$dir/main.tex"
      echo "Created main.tex in $dir"
    fi
  fi
done
