#!/bin/bash

if [[ $1 == *.ipynb ]]; then
    fdname=$(dirname "$1" .ipynb)
    jupyter nbconvert --output-dir="$fdname" "$1"
fi