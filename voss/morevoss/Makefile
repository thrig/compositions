# things actually built by vim voss.lisp (plus other files) and then:
#   map <Leader>t :w!<CR>:!clisp -on-error abort -modern -q -q -repl %<CR><CR>
play: out.midi
	timidity out.midi

out.ly: out.midi
out.midi: voss.lisp ../util.lisp playequation ints2music
	clisp voss.lisp

main.pdf: main.ly out.ly
	lilypond -dno-point-and-click main.ly

silence:
	pkill timidity

clean:
	@-rm -f out.* main.midi main.pdf >/dev/null 2>&2
