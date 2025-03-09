all: gbm-sp25.pdf gbm-sp25.handout.pdf

gbm-sp25.pdf: gbm-sp2025.tex

pacakge.handout.pdf: gbm-sp25.handout.tex

gbm-sp25.handout.tex: gbm-sp2025.tex
	sed '1s/\documentclass{beamer}/\documentclass[handout]{beamer}/' $^ > $@

%.pdf: %.tex
	latexmk -pdf -shell-escape -use-make $^

clean:
	latexmk -CA
	rm -f gbm-sp25.handout.tex *.snm *.nav *.vrb *.pyg
	rm -rf _minted-*/ svg-inkscape/

.PHONY: all clean
