LYS = $(wildcard *.ly)
PDFS = $(LYS:.ly=.pdf)

all: $(PDFS)

%.pdf: %.ly
	lilypond --pdf -dno-point-and-click $<

.PHONY: clean
clean:
	@-rm *.eps *.midi *.pdf *.png 2>/dev/null
