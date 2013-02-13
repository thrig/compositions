all: $(patsubst %.ly,%.pdf,$(wildcard *.ly))

%.pdf : %.ly ; @lilypond --pdf $<

clean:
	@-rm *.midi *.ps *.pdf *.mp3 *.wav 2>/dev/null
