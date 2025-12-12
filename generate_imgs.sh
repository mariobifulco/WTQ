for file in src/mermaid/*.mmd; do
    filename=$(basename -- "$file")
    filename_no_ext="${filename%.*}"

    mmdc -i "$file" -o "src/imgs/$filename_no_ext.png" -b transparent
    echo "Compiled $file to src/imgs/$filename_no_ext.png"
done