#!/usr/bin/env bash

declare -a configs=("antigen" "git" "vim" "zsh" "desktop-entries")

for d in "${configs[@]}";
do
    ( stow $d )
done


