#!/bin/bash

# 処理したいディレクトリを指定
target_dir="."

# 再帰的に `main.tex` ファイルを検索して処理
find "$target_dir" -type f -name "main.tex" | while read -r filepath; do
    # ファイルパスを表示
    echo "Processing file: $filepath"
    
    # `Hamiltonian` を `ハミルトニアン` に置き換え
    if grep -q "Hamiltonian" "$filepath"; then
        sed -i 's/Hamiltonian/ハミルトニアン/g' "$filepath"
        echo "Replaced 'Hamiltonian' with 'ハミルトニアン' in $filepath"
    else
        echo "'Hamiltonian' not found in $filepath"
    fi
done

echo "All files processed."
