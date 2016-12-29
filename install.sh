#!/usr/bin/env bash

for d in `ls . | grep -v install.sh`;
do
    ( stow $d )
done
