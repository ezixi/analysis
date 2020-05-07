#!/bin/bash

if [[ $1 == *.ipynb ]]; then
    fdname=$(dirname "$1" .ipynb)
    parentdir=$(dirname "$fdname")
    jupyter nbconvert --to markdown --output-dir="$parentdir" "$1"
fi