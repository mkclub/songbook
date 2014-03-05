#!/usr/bin/make -f

songbook.pdf: songbook.tex *.tex
	xelatex -interaction batch $@
