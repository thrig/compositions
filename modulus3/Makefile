modulus3: modulus3.pdf

modulus3.pdf: modulus3.ly voice1.ly voice2.ly voice3.ly voice4.ly
	lilypond --pdf modulus3.ly

voice1.ly: gen-v1.pl SharedMusic.pm
	perl -I. gen-v1.pl > voice1.ly

voice2.ly: gen-v2.pl SharedMusic.pm
	perl -I. gen-v2.pl > voice2.ly

voice3.ly: gen-v3.pl SharedMusic.pm
	perl -I. gen-v3.pl > voice3.ly

voice4.ly: gen-v4.pl SharedMusic.pm
	perl -I. gen-v4.pl > voice4.ly

clean:
	@-rm voice*.ly *.midi *.pdf *.mp3 2>/dev/null
