#!/bin/bash

# Function to format a single markdown file
format_markdown_file() {
    local file="$1"
    echo "Formatting $file..."
    
    # Create a temporary file
    local temp_file=$(mktemp)
    
    # Read the file and apply formatting
    cat "$file" | \
    # Add newline before code blocks
    sed -E 's/```(\w*)/\n```\1/g' | \
    # Add newline after code blocks
    sed -E 's/```/```\n/g' | \
    # Ensure code blocks have language specified
    sed -E 's/```\n/```text\n/g' | \
    # Fix double newlines around code blocks
    sed -E 's/\n\n```/\n```/g' | \
    sed -E 's/```\n\n/```\n/g' | \
    # Add newline before lists
    sed -E 's/([^\n])\n- /\1\n\n- /g' | \
    sed -E 's/([^\n])\n[0-9]+\. /\1\n\n1. /g' | \
    # Add newline before headers
    sed -E 's/([^\n])\n#/\1\n\n#/g' | \
    sed -E 's/([^\n])\n##/\1\n\n##/g' | \
    # Add newline after headers
    sed -E 's/#.*\n([^\n])/#.*\n\n\1/g' | \
    sed -E 's/##.*\n([^\n])/##.*\n\n\1/g' | \
    # Remove multiple consecutive newlines (keep max 2)
    sed -E 's/\n{3,}/\n\n/g' | \
    # Remove trailing whitespace
    sed -E 's/[ \t]+$//g' | \
    # Ensure file ends with a single newline
    sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' > "$temp_file"
    
    # Add final newline if missing
    echo "" >> "$temp_file"
    
    # Replace original file with formatted content
    mv "$temp_file" "$file"
}

# Main script
main() {
    # Check if system-design directory exists
    if [ ! -d "system-design" ]; then
        echo "Error: system-design directory not found"
        exit 1
    }
    
    # Find all markdown files
    find system-design -type f -name "*.md" | while read -r file; do
        if [ -f "$file" ]; then
            format_markdown_file "$file"
        fi
    done
    
    echo "Formatting complete!"
}

# Run the script
main 