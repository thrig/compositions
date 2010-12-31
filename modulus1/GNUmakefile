all: $(patsubst %.ly,%.pdf,$(wildcard *.ly))

%.pdf : %.ly ; @lilypond --pdf $<

clean:
	@-rm *.midi *.ps *.pdf 2>/dev/null
