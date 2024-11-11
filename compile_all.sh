#!/bin/bash

# 処理したいディレクトリを指定
target_dir="."

# 再帰的に処理する
find "$target_dir" -type f -name "*.tex" | while read -r file; do
    echo "Processing file: $file"
    lualatex $file
    # ここにファイルへの処理を記述
done
