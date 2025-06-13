#!/bin/bash

# Usage: ./create-system-design.sh <system-name>

if [ -z "$1" ]; then
  echo "Usage: $0 <system-name>"
  exit 1
fi

SYSTEM_NAME="$1"
TEMPLATE_DIR="$(dirname "$0")/template"
TARGET_DIR="$(dirname "$0")/../system-design/$SYSTEM_NAME"
SYSTEM_DESIGN_MD="$(dirname "$0")/../system-design/system-design.md"

# Create the target directory
mkdir -p "$TARGET_DIR"

# Copy and rename template files
for file in "$TEMPLATE_DIR"/template.*; do
  ext="${file##*.}"
  cp "$file" "$TARGET_DIR/$SYSTEM_NAME.$ext"
done

# Prepare display name (title case, replace - and _ with space, capitalize each word)
DISPLAY_NAME=$(echo "$SYSTEM_NAME" | sed -E 's/[-_]/ /g' | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1')

# Prepare the new entry
NEW_ENTRY="[${DISPLAY_NAME}](${SYSTEM_NAME}/${SYSTEM_NAME}.md)"

# Insert the new entry alphabetically in the numbered list in system-design.md
awk -v new_entry="$NEW_ENTRY" '
  BEGIN { in_list=0; found=0; n=0 }
  /^## Systems/ { print; in_list=1; next }
  in_list && /^[0-9]+\. / {
    list[n++] = $0
    next
  }
  in_list && NF && !/^[0-9]+\. / {
    in_list=0
    # Add new entry to the list
    list[n++] = "0. " new_entry
    # Sort and renumber
    asort(list, sorted_list)
    for(i=1;i<=n;i++) {
      # Remove the leading number and dot
      sub(/^[0-9]+\. /, "", sorted_list[i])
      printf "%d. %s\n", i, sorted_list[i]
    }
  }
  { if (!in_list) print }
' "$SYSTEM_DESIGN_MD" > "$SYSTEM_DESIGN_MD.tmp" && mv "$SYSTEM_DESIGN_MD.tmp" "$SYSTEM_DESIGN_MD"

echo "Created new system design in $TARGET_DIR with base files and updated system-design.md." 