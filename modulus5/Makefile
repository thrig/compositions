modulus5: modulus5.pdf

mp3: modulus5
	timidity -Ow modulus5.midi
	lame --tt "Modulus No.5" --ta "Jeremy Mates" --ty 2011 -h -V2 --replaygain-accurate modulus5.wav modulus5.mp3
	@-rm *.wav

modulus5.pdf: modulus5.ly
	lilypond --pdf modulus5.ly

clean:
	@-rm voice*.ly *.midi *.pdf *.mp3 2>/dev/null
