# Makefile for the minimal-opend6 SRD.
#
# Note: all .pdf, .html, .epub, .docx, .rtf, and .odt files are generated,
# and are removed by the clean target.  Files named *.gen.* are
# generated for debugging, and are removed by the clean target.

# If you produce PDF using pandoc's "ms" output and groff, FONTFAMILY
# should be one of the following:
#
#    bookman, schoolbook, palatino, times, helvetica, helvetica-narrow
#
# You can add fonts yourself and extend this makefile with them.
# There is a utility that makes installing fonts for groff relatively
# easily:
#
#    https://www.schaffter.ca/mom/mom-05.html#install-font
#
# Look for the first section starting with "ifeq ($(FONTFAMILY)," to
# see how to extend this makefile for fonts you've installed for
# groff.
#
# ConTeXt can generally use any font installed on your system.  Look
# for the second section starting with "ifeq ($(FONTFAMILY)," to see
# how to extend this makefile for other fonts for use with ConTeXt.
FONTFAMILY=palatino

PANDOC=pandoc
PANDOCOPTS=

OUT=output/

all:	$(OUT)mini-six-standard-trademark-license.html \
	$(OUT)mini-six-standard-trademark-license.stmt.ms.pdf \
	$(OUT)minimal-opend6-srd.docx \
	$(OUT)minimal-opend6-srd.epub \
	$(OUT)minimal-opend6-srd.mobi \
	$(OUT)minimal-opend6-srd.html \
	$(OUT)minimal-opend6-srd.odt \
	$(OUT)minimal-opend6-srd.stmt.ms.pdf \
	$(OUT)minimal-opend6-srd.rtf \
	$(OUT)minimal-opend6-srd.gen.md \
	$(OUT)minimal-opend6-srd.rst

# When the ConTexT build produces good output, put the following back in the
# "all" target.
#	$(OUT)minimal-opend6-srd.stmt.ctx.pdf \

# Just build the PDF using pandoc's "ms" output.
ms: $(OUT)minimal-opend6-srd.stmt.ms.pdf $(OUT)minimal-opend6-srd.stmt.gen.ms

# Turn the PDF from pandoc's "ms" output into a form suitable for printing
# as a pamphlet.
book: $(OUT)minimal-opend6-srd.stmt.ms-book.pdf

# The ConTeXt build does not currently provide good output.
ctx: $(OUT)minimal-opend6-srd.stmt.ctx.pdf $(OUT)minimal-opend6-srd.stmt.gen.ctx

native: $(OUT)minimal-opend6-srd.native

$(OUT)minimal-opend6-srd.epub: epub.css
$(OUT)minimal-opend6-srd.html \
$(OUT)minimal-opend6-srd.docx \
$(OUT)minimal-opend6-srd.odt: \
	PANDOCOPTS+=--toc

$(OUT)mini-six-standard-trademark-license.stmt.ms.pdf \
$(OUT)minimal-opend6-srd.html \
$(OUT)minimal-opend6-srd.epub \
$(OUT)minimal-opend6-srd.stmt.ms.pdf: general.lua

$(OUT)minimal-opend6-srd.stmt.ms.pdf \
$(OUT)mini-six-standard-trademark-license.stmt.ms.pdf: statement.ms

$(OUT)minimal-opend6-srd.stmt.ctx.pdf \
$(OUT)mini-six-standard-trademark-license.stmt.ctx.pdf: statement.context

%.gen.eps : %.png
	magick $< $@


ifeq ($(FONTFAMILY),avantgarde)
MSFONTFAMILY=A
else ifeq ($(FONTFAMILY),bookman)
MSFONTFAMILY=BM
else ifeq ($(FONTFAMILY),schoolbook)
MSFONTFAMILY=N
else ifeq ($(FONTFAMILY),helvetica)
MSFONTFAMILY=H
else ifeq ($(FONTFAMILY),helvetica-narrow)
MSFONTFAMILY=HN
else ifeq ($(FONTFAMILY),palatino)
MSFONTFAMILY=P
else ifeq ($(FONTFAMILY),times)
MSFONTFAMILY=T
else ifeq ($(FONTFAMILY),optima)
# You must install this.
MSFONTFAMILY=Optima
else ifeq ($(FONTFAMILY),alegreya)
# You must install this.
MSFONTFAMILY=Alegreya
else ifeq ($(FONTFAMILY),alegreyasans)
# You must install this.
MSFONTFAMILY=AlegreyaSans
else ifeq ($(FONTFAMILY),cormorantgaramond)
# You must install this.
MSFONTFAMILY=CormorantGaramond
else ifeq ($(FONTFAMILY),cormorantgaramondmedium)
# You must install this.
MSFONTFAMILY=CormorantGaramondM
else ifeq ($(FONTFAMILY),ebgaramond)
# You must install this.
MSFONTFAMILY=EBGaramond
else ifeq ($(FONTFAMILY),lato)
# You must install this.
MSFONTFAMILY=Lato
else ifeq ($(FONTFAMILY),ptsans)
# You must install this.
MSFONTFAMILY=PTSans
else ifeq ($(FONTFAMILY),sourcesanspro)
# You must install this.
MSFONTFAMILY=SourceSansPro
else ifeq ($(FONTFAMILY),sourceserifpro)
# You must install this.
MSFONTFAMILY=SourceSerifPro
else ifeq ($(FONTFAMILY),roboto)
# You must install this.
MSFONTFAMILY=Roboto
else ifeq ($(FONTFAMILY),montserrat)
# You must install this.
MSFONTFAMILY=Montserrat
else ifeq ($(FONTFAMILY),crimsontext)
# You must install this.
MSFONTFAMILY=CrimsonText
else ifeq ($(FONTFAMILY),cormorant)
# You must install this.
MSFONTFAMILY=Cormorant
else ifeq ($(FONTFAMILY),cormorantmedium)
# You must install this.
MSFONTFAMILY=CormorantM
else ifeq ($(FONTFAMILY),opensans)
# You must install this.
MSFONTFAMILY=OpenSans
else ifeq ($(FONTFAMILY),josefinsans)
# You must install this.
MSFONTFAMILY=JosefinSans
else ifeq ($(FONTFAMILY),notoserif)
# You must install this.
MSFONTFAMILY=NotoSerif
else ifeq ($(FONTFAMILY),notosans)
# You must install this.
MSFONTFAMILY=NotoSans
else 
$(error Unknown FONTFAMILY: $(FONTFAMILY))
endif

$(OUT)%.ms.pdf : %.rst
	$(PANDOC) -s -r rst -w ms --lua-filter=general.lua \
		--variable=twocol --variable=usegrowps $(MSVARIABLES) \
		--variable=fontfamily=$(MSFONTFAMILY) \
		$(FLOAT) $(PANDOCOPTS) \
		--template=tkb --output=$@ $<

$(OUT)%.gen.ms : %.rst
	$(PANDOC) -s -r rst -w ms --lua-filter=general.lua \
		--variable=twocol --variable=usegrowps $(MSVARIABLES) \
		--variable=fontfamily=$(MSFONTFAMILY) \
		$(FLOAT) $(PANDOCOPTS) \
		--template=tkb --output=$@ $<

$(OUT)%.stmt.ms.pdf : %.rst
	$(PANDOC) -s -r rst -w ms --template=statement $(MSVARIABLES) \
		-V usegrowps -V psincr=3p -V growps=4 \
		-V fontfamily=$(MSFONTFAMILY) \
		$(FLOAT) --lua-filter=general.lua $(PANDOCOPTS) \
		--output=$@ --pdf-engine-opt=-P-p8.5i,5.5i $<

$(OUT)%.stmt.gen.ms : %.rst
	$(PANDOC) -s -r rst -w ms --template=statement $(MSVARIABLES) \
		-V usegrowps -V psincr=2p -V growps=4 \
		-V fontfamily=$(MSFONTFAMILY) \
		$(FLOAT) --lua-filter=general.lua $(PANDOCOPTS) \
		--output=$@ $<

$(OUT)%.gen.md : %.rst
	$(PANDOC) -r rst -w markdown --output=$@ $<

ifndef NOCONTEXT
ifeq ($(FONTFAMILY),avantgarde)
CONTEXTMAINFONT="Tex Gyre Adventor"
CONTEXTMATHFONT="TeX Gyre Pagella Math"
CONTEXTSANSFONT="Tex Gyre Adventor"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),bookman)
CONTEXTMAINFONT="TeX Gyre Bonum"
CONTEXTMATHFONT="TeX Gyre Bonum Math"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),schoolbook)
CONTEXTMAINFONT="TeX Gyre Schola"
CONTEXTMATHFONT="TeX Gyre Schola Math"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),helvetica)
CONTEXTMAINFONT="TeX Gyre Heros"
CONTEXTMATHFONT="TeX Gyre Termes Math"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),helvetica-narrow)
CONTEXTMAINFONT="TeX Gyre Heros CN"
CONTEXTMATHFONT="TeX Gyre Termes Math"
CONTEXTSANSFONT="TeX Gyre Heros CN"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),palatino)
CONTEXTMAINFONT="TeX Gyre Pagella"
CONTEXTMATHFONT="TeX Gyre Pagella Math"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),times)
CONTEXTMAINFONT="TeX Gyre Termes"
CONTEXTMATHFONT="TeX Gyre Termes Math"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),optima)
# You must install this.
CONTEXTMAINFONT="Optima"
CONTEXTMATHFONT="Optima"
CONTEXTSANSFONT="Optima"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),alegreya)
# You must install this.
CONTEXTMAINFONT="Alegreya"
CONTEXTMATHFONT="Alegreya"
CONTEXTSANSFONT="Alegreya Sans"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),alegreyasans)
# You must install this.
CONTEXTMAINFONT="Alegreya Sans"
CONTEXTMATHFONT="Alegreya Sans"
CONTEXTSANSFONT="Alegreya Sans"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),cormorantgaramond)
# You must install this.
CONTEXTMAINFONT="Cormorant Garamond"
CONTEXTMATHFONT="Cormorant Garamond"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),ebgaramond)
# You must install this.
CONTEXTMAINFONT="EBGaramond"
CONTEXTMATHFONT="EBGaramond"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),lato)
# You must install this.
CONTEXTMAINFONT="Lato"
CONTEXTMATHFONT="Lato"
CONTEXTSANSFONT="Lato"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),ptsans)
# You must install this.
CONTEXTMAINFONT="PT Sans"
CONTEXTMATHFONT="PT Sans"
CONTEXTSANSFONT="PT Sans"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),sourcesanspro)
# You must install this.
CONTEXTMAINFONT="Source Sans Pro"
CONTEXTMATHFONT="Source Sans Pro"
CONTEXTSANSFONT="Source Sans Pro"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),roboto)
# You must install this.
CONTEXTMAINFONT="Roboto"
CONTEXTMATHFONT="Roboto"
CONTEXTSANSFONT="Roboto"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),montserrat)
# You must install this.
CONTEXTMAINFONT="Montserrat"
CONTEXTMATHFONT="Montserrat"
CONTEXTSANSFONT="Montserrat"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),crimsontext)
# You must install this.
CONTEXTMAINFONT="CrimsonText"
CONTEXTMATHFONT="CrimsonText"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),cormorant)
# You must install this.
CONTEXTMAINFONT="Cormorant"
CONTEXTMATHFONT="Cormorant"
CONTEXTSANSFONT="TeX Gyre Heros"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),opensans)
# You must install this.
CONTEXTMAINFONT="Open Sans"
CONTEXTMATHFONT="Open Sans"
CONTEXTSANSFONT="Open Sans"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),notoserif)
CONTEXTMAINFONT="Noto Serif"
CONTEXTMATHFONT="Noto Serif"
CONTEXTSANSFONT="Noto Sans"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),notosans)
CONTEXTMAINFONT="notosans"
CONTEXTMATHFONT="notosans"
CONTEXTSANSFONT="notosans"
CONTEXTMONOFONT="TeX Gyre Cursor"
else ifeq ($(FONTFAMILY),notosans)
else
$(error Unknown FONTFAMILY: $(FONTFAMILY))
endif
CONTEXTFONTS=\
	-V mainfont=$(CONTEXTMAINFONT) \
	-V mathfont=$(CONTEXTMATHFONT) \
	-V sansfont=$(CONTEXTSANSFONT) \
	-V monofont=$(CONTEXTMONOFONT)

CONTEXTSETUP=-V fontsize=10pt -V whitespace=quarterline -V setupitemize='before={\blank[quarterline]},after={\blank[quarterline]}' -V setupenumerate='before={\blank[quarterline]},after={\blank[quarterline]}' -V linkcolor=darkgreen -V contrastcolor=blue

# Currently producing output through ConTeXt does not work properly,
# because pandoc currently produces ConTeXt source that lets tables
# float.  This causes the position of the tables to get out of sync
# with the the text, which is very confusing.  All the other output
# formats do not let tables float, and the text is written with that
# expection.  Maybe some day.
$(OUT)%.ctx.pdf : %.rst
	pandoc -s -r rst -w context --lua-filter=general.lua \
		-V location=force -V number-figures=no -V number-tables=no \
		--template=tkb $(CONTEXTFONTS) \
		$(FLOAT) $(CONTEXTSETUP) $(PANDOCOPTS) \
		--output=$@ $<
$(OUT)%.gen.ctx : %.rst
	pandoc -s -r rst -w context --lua-filter=general.lua \
		-V location=force -V number-figures=no -V number-tables=no \
		--template=tkb $(CONTEXTFONTS) \
		$(FLOAT) $(CONTEXTSETUP) $(PANDOCOPTS) \
		--output=$@ $<

$(OUT)%.stmt.ctx.pdf : %.rst
	pandoc -s -r rst -w context --lua-filter=general.lua \
		-V location=force -V number-figures=no -V number-tables=no \
		--template=statement $(CONTEXTFONTS) \
		$(FLOAT) $(CONTEXTSETUP) $(PANDOCOPTS) \
		--output=$@ $<
$(OUT)%.stmt.gen.ctx : %.rst
	pandoc -s -r rst -w context --lua-filter=general.lua \
		-V location=force -V number-figures=no -V number-tables=no \
		--template=statement $(CONTEXTFONTS) \
		$(FLOAT) $(CONTEXTSETUP) $(PANDOCOPTS) \
		--output=$@ $<
endif

$(OUT)%.html : %.rst
	$(PANDOC) -s -r rst -w html --lua-filter=general.lua \
		$(PANDOCOPTS) --css=epub.css --output=$@ $<


$(OUT)%.epub : %.rst
	$(PANDOC) -s -r rst -w epub --toc --lua-filter=general.lua \
		$(PANDOCOPTS) --css=epub.css --output=$@ $<

# This uses the ebook-convert utility from Calibre
# (https://calibre-ebook.com/) to produce a .mobi file from an .epub
# file.
%.mobi : %.epub
	ebook-convert $< $@ 


$(OUT)%.odt : %.rst
	$(PANDOC) -s -r rst -w odt $(ODTREFERENCEDOC) $(PANDOCOPTS) \
		-o $@ $<

$(OUT)%.docx : %.rst
	$(PANDOC) -s -r rst -w docx $(DOCXREFERENCEDOC) $(PANDOCOPTS) \
		-o $@ $<

$(OUT)%.rst : %.rst
	cp $< $@

$(OUT)%.rtf : %.rst
	$(PANDOC) -s -r rst -w rtf $(PANDOCOPTS) -o $@ $<

$(OUT)%.native : %.rst
	$(PANDOC) -s -r rst -w native -o $@ $<

%-book.pdf: %.pdf
	pdfbook2 --paper=letter -o20 -i50 -t30 -b20 $<

clean:
	-rm	$(OUT)*.ms.pdf $(OUT)*.ctx.pdf  \
		$(OUT)*.gen.ms $(OUT)*.gen.ctx \
		$(OUT)*.odt $(OUT)*.docx $(OUT)*.epub $(OUT)*.mobi \
		$(OUT)*.html $(OUT)*.gen.eps $(OUT)*.native $(OUT)*-book.pdf \
		$(OUT)*.gen.md $(OUT)*.rtf $(OUT)*.rst

release: all
	cd $(OUT) && zip ../../minimal-opend6-srd-$$(git describe --tags)-$$(date '+%F').zip *

