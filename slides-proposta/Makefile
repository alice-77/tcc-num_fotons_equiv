BASENAME=slides

PROGRAM_BIB=bibtex
PROGRAM_AXO=axohelp
PROGRAM_PDFLATEX=pdflatex
PROGRAM_LATEX=latex
PROGRAM_HTLATEX=htlatex
PROGRAM_MAKEINDEX=makeindex

pdf:	
	${PROGRAM_PDFLATEX} ${BASENAME}.tex
	${PROGRAM_AXO} ${BASENAME}
	${PROGRAM_BIB} ${BASENAME}
	${PROGRAM_MAKEINDEX} ${BASENAME}
	${PROGRAM_PDFLATEX} ${BASENAME}.tex
	${PROGRAM_PDFLATEX} ${BASENAME}.tex
	${PROGRAM_PDFLATEX} ${BASENAME}.tex

pdf1:	
	${PROGRAM_PDFLATEX} ${BASENAME}.tex

clean:
	rm -f *.aux *.log *.toc *.lot *.lof *.out *.blg *.bbl *.idx *.ilg *.ind *.brf *.ax*
	rm -f `find . -name "*.log"`
	rm -f `find . -name "*.aux"`
	rm -f *.tmp *.css *.lg *.idv *.4tc *.xref *.4ct *.png *.html

all:
	make clean
	make pdf

