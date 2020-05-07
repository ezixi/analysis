#!/bin/bash

if [[ $1 == *.ipynb ]]; then
    fdname=$(dirname "$1")
    jupyter nbconvert --to markdown --output-dir="$fdname" "$1"
fi