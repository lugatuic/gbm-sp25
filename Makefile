all: gbm-2024.pdf gbm-2024.handout.pdf

gbm-2024.pdf: gbm-2024.tex

pacakge.handout.pdf: gbm-2024.handout.tex

gbm-2024.handout.tex: gbm-2024.tex
	sed '1s/\documentclass{beamer}/\documentclass[handout]{beamer}/' $^ > $@

%.pdf: %.tex
	latexmk -pdf -shell-escape -use-make $^

clean:
	latexmk -CA
	rm -f gbm-2024.handout.tex *.snm *.nav *.vrb *.pyg
	rm -rf _minted-*/ svg-inkscape/

.PHONY: all clean
