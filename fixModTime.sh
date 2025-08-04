#!/bin/bash

# Loop through all files in the current directory
git ls-files | while IFS= read -r file; do
    # Get the last commit date for the file
    commit_date=$(git log -1 --format="%ct" -- "$file")
    
    # Check if commit_date is not empty
    if [ -n "$commit_date" ]; then
        # Update the file's last modified timestamp
        touch -d @"$commit_date" "$file"
    else
        echo "No commit date found for $file"
    fi
done
