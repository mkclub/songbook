#!/usr/bin/make -f

songbook.pdf: songbook.tex */*.tex Піккардійська_терція/Плине_кача.tex
	xelatex -interaction batch $<

Піккардійська_терція/Плине_кача.tex: Піккардійська_терція/Плине_кача.lytex
	lilypond-book \
		--latex-program=xelatex \
		-f latex \
		--out `dirname $<` $<
