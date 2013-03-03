menuet: menuet3.pdf

mp3: menuet3.pdf
	timidity -Ow menuet3.midi
	lame --tt "Mad Clown Minuet" --ta "Jeremy Mates" --ty 2011 -h -V2 --replaygain-accurate menuet3.wav menuet3.mp3
	@-rm *.wav

menuet3.pdf: menuet3.ly
	lilypond -dno-point-and-click menuet3.ly

clean:
	@-rm *.midi *.wav *.mp3 *.pdf 2>/dev/null
