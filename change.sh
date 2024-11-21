#!/bin/bash

# 処理したいディレクトリを指定
target_dir="."

# 現在のディレクトリを記録
original_dir=$(pwd)
# 再帰的に .tex ファイルを検索して処理
find "$target_dir" -type f -name "main.tex" | while read -r filename; do
    # ファイルのあるディレクトリを取得
    file_dir=$(dirname "$filename")
    
    # ファイルのあるディレクトリに移動
    cd "$file_dir" || { echo "Failed to change directory to $file_dir"; exit 1; }
    if mkdir fig; then
    # ディレクトリ作成成功時
        cp ~/desktop/AQuantum/fig/appilogo-circular-full.png ./fig/ && echo "File copied successfully."
    else
        # ディレクトリ作成失敗時
        cp ~/desktop/AQuantum/fig/appilogo-circular-full.png ./fig/
        echo "Skipped: Could not create 'fig' directory."
    fi
    # 処理を実行
    # rm main.aux; 
    echo "Processing file: $(basename "$filename") in directory: $file_dir"
    # ここに .tex ファイルに対する処理を記述
    # 例: コンパイル
    # lualatex "$(basename "$filename")"
    # rm main.bcf; rm main.log; rm main.out; rm main.run.xml
    # 元のディレクトリに戻る
    cd "$original_dir" || { echo "Failed to return to the original directory"; exit 1; }
done

echo "Finished processing all .tex files."
