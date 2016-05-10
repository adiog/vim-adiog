TEX=$(wildcard *.tex)
PDF=$(TEX:.tex=.pdf)

all: $(PDF) clean_log

clean: clean_log
	rm -f *.pdf

clean_log:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb

%.pdf: %.tex
	pdflatex $^

