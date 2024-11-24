#!/bin/bash

# 処理したいディレクトリを指定
target_dir="."

# 再帰的に `main.tex` ファイルを検索して処理
find "$target_dir" -type f -name "main.tex" | while read -r filepath; do
    # ファイルパスを表示
    echo "Processing file: $filepath"
    
    # `\nabla` を `\grad` に置き換え
    if grep -q "\\nabla" "$filepath"; then
        sed -i 's/\\nabla/\\grad/g' "$filepath"
        echo "Replaced '\\nabla' with '\\grad' in $filepath"
    else
        echo "'\\nabla' not found in $filepath"
    fi
done

echo "All files processed."
