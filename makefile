all : images pdfs

images :
	dot -Tpng -odcp.png dcp.dot

pdfs :
	pdflatex wiki.tex
