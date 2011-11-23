modulus2: modulus2.pdf

mp3: modulus2
	timidity -Ow modulus2.midi
	lame --tt "Modulus No.2 - Istrian" --ta "Jeremy Mates" --ty 2011 -h -V2 --replaygain-accurate modulus2.wav modulus2.mp3
	@-rm *.wav

modulus2.pdf: modulus2.ly voice1.ly voice2.ly
	lilypond --pdf modulus2.ly

voice1.ly: gen-v1.pl
	perl -I. gen-v1.pl > voice1.ly

voice2.ly: gen-v2.pl
	perl -I. gen-v2.pl > voice2.ly

clean:
	@-rm voice*.ly *.midi *.pdf *.mp3 2>/dev/null
