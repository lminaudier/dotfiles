#!/usr/bin/env bash

declare -a configs=("git" "vim" "zsh")

for d in "${configs[@]}";
do
    ( stow $d )
done


