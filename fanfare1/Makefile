fanfare: fanfare1.pdf

mp3: fanfare1.pdf
	timidity -Ow fanfare1.midi
	lame --tt "Clarke, Markov, Mouret, & I" --ta "Jeremy Mates" --ty 2012 -h -V2 --replaygain-accurate fanfare1.wav fanfare1.mp3
	@-rm *.wav

fanfare1.pdf: fanfare1.ly
	lilypond fanfare1.ly

clean:
	@-rm *.midi *.wav *.mp3 *.pdf 2>/dev/null
