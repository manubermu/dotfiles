#!/bin/bash

git_folders=(
  Github
)

for FOLDER in "${git_folders[@]}"
do
  mkdir -p "$HOME/Documents/$FOLDER" # -p => creates parent directory if not exists
done