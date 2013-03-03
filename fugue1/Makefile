fugue1: fugue1.pdf

mp3: fugue1
	timidity -Ow fugue1.midi
	@-rm *.wav

fugue1.pdf: fugue1.ly articulate.ly lilywrap
	lilypond -dno-point-and-click --pdf --output=tmp fugue1.ly
	./lilywrap fugue1.ly
	mv tmp.pdf fugue1.pdf
	@-rm tmp.*

clean:
	@-rm *.midi *.wav *.mp3 *.pdf 2>/dev/null
