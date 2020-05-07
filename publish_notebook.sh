#!/bin/bash

if [[ $1 == *.ipynb ]]; then
    fbname=$(basename "$1" .ipynb)
    fdname=$(dirname "$1" .ipynb)
    jupyter nbconvert --output-dir="$fdname" "$fbname"
fi