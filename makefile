pdfs = wiki.pdf design-2017-02-08.pdf recap_app8_2014.pdf
pngs = dcp.png

.PHONY: all clean

all: $(pngs) $(pdfs)

%.png: %.dot
	dot -Tpng -o$@ $<

%.pdf: %.tex
	pdflatex $<
	pdflatex $<

clean:
	rm -f $(pdfs) $(pngs) *.aux *.log *.out
