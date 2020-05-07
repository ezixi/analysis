#!/bin/bash

if [[ $1 == *.ipynb ]]; then
    fdname=$(dirname "$1" .ipynb)
    jupyter nbconvert --template basic --output-dir="../$fdname" "$1"
fi