play: out.midi
	timidity out.midi

out.midi: voss.lisp util.lisp playequation ints2music
	clisp voss.lisp

main.pdf: main.ly out.midi
	lilypond -dno-point-and-click main.ly

silence:
	pkill timidity

clean:
	@-rm -f out* util.fas util.lib >/dev/null 2>&2
