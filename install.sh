#!/usr/bin/env bash

declare -a configs=("antigen" "git" "vim" "zsh")

for d in "${configs[@]}";
do
    ( stow $d )
done


