#!/bin/bash

# Path to draw.io executable
DRAWIO="/Applications/draw.io.app/Contents/MacOS/draw.io"

# Check if draw.io is installed
if [ ! -f "$DRAWIO" ]; then
    echo "Error: draw.io is not installed."
    echo "Please install draw.io desktop application using:"
    echo "brew install --cask drawio"
    exit 1
fi

# Function to convert draw.io files to SVG and PNG
convert_diagrams() {
    local dir="$1"
    for file in "$dir"/*.drawio; do
        if [ -f "$file" ]; then
            filename=$(basename "$file" .drawio)
            echo "Converting $file to SVG and PNG..."
            # Convert to SVG
            "$DRAWIO" -x "$file" -o "${dir}/${filename}.svg"
            # Convert to PNG
            "$DRAWIO" -x "$file" -o "${dir}/${filename}.png"
        fi
    done
}

# Convert files in system-design directory
convert_diagrams "system-design"

# Convert files in all subdirectories
for dir in system-design/*/; do
    if [ -d "$dir" ]; then
        convert_diagrams "$dir"
    fi
done

echo "Conversion complete!" 