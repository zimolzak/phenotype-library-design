pdfs = wiki.pdf design-2017-02-08.pdf recap_app8_2014.pdf
pngs = dcp.png

.PHONY: all clean

all: $(pngs) $(pdfs) README.md

%.png: %.dot
	dot -Tpng -o$@ $<

%.pdf: %.tex
	pdflatex $<
	pdflatex $<

README.md: wiki.tex
	echo \# What Records Should VA Keep About Phenotypes\? > $@
	echo >> $@
	echo Andrew Zimolzak, MD, MMSc >> $@
	echo >> $@
	echo March 27, 2017 >> $@
	echo >> $@
	pandoc -o temp.md $<
	cat temp.md >> $@
	rm -f temp.md

clean:
	rm -f $(pdfs) $(pngs) *.aux *.log *.out README.md
