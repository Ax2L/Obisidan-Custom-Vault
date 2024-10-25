#!/bin/bash

# Check if Git LFS is installed, and install it if not
if ! git lfs --version &> /dev/null
then
    echo "Git LFS not found. Installing Git LFS..."
    git lfs install
else
    echo "Git LFS is already installed."
fi

# Initialize Git LFS
git lfs install

# Remove large files from Git history
echo "Removing large files from Git history..."
git filter-repo --path Tools/1.\ Prepared\ Apps/Freeter/Freeter-2.2.0-alpha-mac-arm64.dmg --invert-paths
git filter-repo --path Tools/1.\ Prepared\ Apps/Freeter/freeter --invert-paths

# Add all changes
echo "Adding all changes..."
git add .

# Commit changes
echo "Committing changes..."
git commit -m "Cleaned up large files and initial commit"

# Set the branch to main
echo "Setting branch to main..."
git branch -M main

# Push changes to the remote repository
echo "Pushing changes to remote repository..."
git push -u origin main

echo "Done."
