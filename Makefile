
BASENAME=main-dissertacao

PROGRAM_BIB=bibtex
PROGRAM_PDFLATEX=pdflatex
PROGRAM_LATEX=latex
PROGRAM_HTLATEX=htlatex
PROGRAM_MAKEINDEX=makeindex

help:
#@cat LEIAME
	@echo 'Ajuda'

pdf:	
	${PROGRAM_PDFLATEX} ${BASENAME}.tex
	${PROGRAM_BIB} ${BASENAME}
	${PROGRAM_MAKEINDEX} ${BASENAME}
	${PROGRAM_PDFLATEX} ${BASENAME}.tex
	${PROGRAM_PDFLATEX} ${BASENAME}.tex
	${PROGRAM_PDFLATEX} ${BASENAME}.tex

dvi:	
	${PROGRAM_LATEX} ${BASENAME}.tex
	${PROGRAM_BIB} ${BASENAME}
	${PROGRAM_MAKEINDEX} ${BASENAME}
	${PROGRAM_LATEX} ${BASENAME}.tex
	${PROGRAM_LATEX} ${BASENAME}.tex
	${PROGRAM_LATEX} ${BASENAME}.tex

html:	
	${PROGRAM_HTLATEX} ${BASENAME}.tex
	${PROGRAM_BIB} ${BASENAME}
	${PROGRAM_MAKEINDEX} ${BASENAME}
	${PROGRAM_HTLATEX} ${BASENAME}.tex

ps:
	make dvi
	dvips ${BASENAME}.dvi -o ${BASENAME}.ps

pdf1:	
	${PROGRAM_PDFLATEX} ${BASENAME}.tex

clean:
	rm -f *.aux *.log *.toc *.lot *.lof *.out *.blg *.bbl *.idx *.ilg *.ind *.brf
	rm -f `find . -name "*.log"`
	rm -f `find . -name "*.aux"`
	rm -f *.tmp *.lg *.idv *.4tc *.xref *.4ct *.html
all:
	make clean
	make pdf
