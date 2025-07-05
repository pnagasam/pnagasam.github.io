#!/bin/bash

# Script to convert all .md files in current directory to HTML using pandoc

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "Error: pandoc is not installed or not in PATH"
    exit 1
fi

# Find all .md files recursively and process them
file_count=0

while IFS= read -r -d '' file; do
    file_count=$((file_count + 1))
    
    # Get filename without extension
    basename="${file%.md}"
    output_file="${basename}.html"
    
    echo "Converting: $file -> $output_file"
    
    # Run pandoc command
    pandoc -s --katex=https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/ "$file" > "$output_file"
    
    # Check if conversion was successful
    if [ $? -eq 0 ]; then
        echo "✓ Successfully converted $file"
    else
        echo "✗ Failed to convert $file"
    fi
done < <(find . -name "*.md" -type f -print0)

# Check if any .md files were processed
if [ $file_count -eq 0 ]; then
    echo "No .md files found in current directory or subdirectories"
    exit 0
fi

echo "Conversion complete! Processed $file_count file(s)."

echo "Conversion complete!"
