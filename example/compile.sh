#!/bin/sh

pdflatex --shell-escape masterthesis
biber masterthesis
makeindex 'masterthesis.idx'
pdflatex --shell-escape masterthesis
pdflatex --shell-escape masterthesis