#!/bin/bash

# Create output directory if it doesn't exist
mkdir -p system-design/svg

# Convert each draw.io file to SVG
for file in system-design/*.drawio; do
    if [ -f "$file" ]; then
        filename=$(basename "$file" .drawio)
        echo "Converting $file to SVG..."
        docker run --rm -v "$(pwd):/data" jgraph/drawio-cli -x "$file" -o "system-design/svg/${filename}.svg"
    fi
done

echo "Conversion complete!" 