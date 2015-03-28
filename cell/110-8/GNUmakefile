all: includes sixteen-thoughts.pdf

gengraph: gengraph.c connected.c
	$(CC) $(CFLAGS) -std=c99 -o gengraph connected.c gengraph.c

sixteen-thoughts.pdf: includes sixteen-thoughts.tex
	xelatex -halt-on-error -interaction=batchmode sixteen-thoughts.tex
	bibtex sixteen-thoughts.aux
	xelatex -halt-on-error -interaction=batchmode sixteen-thoughts.tex
	xelatex -halt-on-error -interaction=batchmode sixteen-thoughts.tex

# TODO flag *.tex for rebuild if something has changed in graphics
.PHONY: clean includes

includes:
	$(MAKE) -j 2 -C includes

clean:
	@-rm -f sixteen-thoughts.aux sixteen-thoughts.log sixteen-thoughts.out sixteen-thoughts.bbl sixteen-thoughts.blg gengraph >/dev/null 2>&1
	@-$(MAKE) -C includes clean
