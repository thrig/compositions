mfsft18m.pdf: mfsft18m mfsft18m.ly
	perl mfsft18m
	lilypond -dno-point-and-click mfsft18m.ly

depend:
	cpanm --installdeps .

clean:
	rm notes.ly voice*.ly
