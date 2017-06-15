CFLAGS += -lm

out.midi: axoneminusx midiify
	./axoneminusx | perl midiify out.midi

attractors.midi: attractors midiify-attractors
	./attractors | perl midiify-attractors attractors.midi

attractors: attractors.c
axoneminusx: axoneminusx.c

depend:
	cpanm --installdeps .

clean:
	@rm -f attractors axoneminusx *.midi >/dev/null 2>&1
