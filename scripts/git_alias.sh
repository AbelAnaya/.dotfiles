#!/usr/bin/bash

# Git aliases
LOD="log --oneline --graph --decorate"
ST="status"
CP="cherry-pick"

echo "Setting git aliases...\n"
echo "git st: git $ST"
echo "git lod: git $LOD"
echo "git cp: git $CP"

git config --global alias.st "$ST"
git config --global alias.lod "$LOD"
git config --global alias.cp "$CP"

