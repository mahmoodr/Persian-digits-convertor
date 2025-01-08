#!/bin/bash

# Path to the folder containing files
folder_path="/path/to/your/folder"

# Function to convert Persian digits to English
convert_persian_to_english() {
    echo "$1" | sed \
        -e 's/۰/0/g' \
        -e 's/۱/1/g' \
        -e 's/۲/2/g' \
        -e 's/۳/3/g' \
        -e 's/۴/4/g' \
        -e 's/۵/5/g' \
        -e 's/۶/6/g' \
        -e 's/۷/7/g' \
        -e 's/۸/8/g' \
        -e 's/۹/9/g'
}

# Iterate over files in the folder
for file in "$folder_path"/*; do
    # Extract the file name
    filename=$(basename "$file")
    # Convert the file name to English digits
    new_filename=$(convert_persian_to_english "$filename")
    # Rename the file if the name has changed
    if [[ "$filename" != "$new_filename" ]]; then
        mv "$folder_path/$filename" "$folder_path/$new_filename"
        echo "Renamed: $filename -> $new_filename"
    fi
done
