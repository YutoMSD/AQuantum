#!/bin/bash

# 処理したいディレクトリを指定
target_dir="."

# 再帰的に `main.tex` ファイルを検索して処理
find "$target_dir" -type f -name "main.tex" | while read -r filepath; do
    # ファイルパスを表示
    echo "Processing file: $filepath"
    
    # `Hamiltonian` を `ハミルトニアン` に置き換え
    if grep -q "\begin{equation}" "$filepath"; then
        sed -i 's/\begin{equation}/\begin{align}/g' "$filepath"
        sed -i 's/\end{equation}/\end{align}/g' "$filepath"
        # echo "Replaced 'Hamiltonian' with 'ハミルトニアン' in $filepath"
    else
        echo "'\begin{equation}' not found in $filepath"
    fi
    if grep -q "\mathrm{e}" "$filepath"; then
        sed -i 's/\mathrm{e}/\e/g' "$filepath"
    else
        echo "'\begin{equation}' not found in $filepath"
    fi
done

echo "All files processed."
