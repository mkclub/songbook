#!/usr/bin/make -f

songbook.pdf: songbook.tex */*.tex Піккардійська_терція/Плине_кача.tex
	xelatex -interaction batch $<

Піккардійська_терція/Плине_кача.tex: Піккардійська_терція/Плине_кача.lytex
	cd `dirname $<` && lilypond-book \
		--latex-program=xelatex \
		-f latex `basename $<`

Піккардійська_терція/Плине_кача.tex: Піккардійська_терція/Плине_кача.ly

all: songbook.pdf

.PHONY: all
