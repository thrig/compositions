CFLAGS += -lm

out.midi: axoneminusx midiify
	./axoneminusx | perl midiify out.midi

axoneminusx: axoneminusx.c

depend:
	cpanm --installdeps .

clean:
	@rm -f axoneminusx out.midi >/dev/null 2>&1
