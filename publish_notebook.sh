#!/bin/bash

if [[ $1 == *.ipynb ]]; then
    fdname="$(dirname "$1")"
    dpname="$(dirname "$fdname")"
    jupyter nbconvert --to markdown --output-dir="$dpname" "$1"
fi