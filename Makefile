# 학번
STDNO=z0000000
# 이름
FULLNAME=Last_First

PY=python
PANDOC=pandoc

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(INPUTDIR)/templates
STYLEDIR=$(BASEDIR)/style

OUTPUTFILE=$(OUTPUTDIR)/$(STDNO)-$(FULLNAME)-Thesis.pdf
BIBFILE=$(INPUTDIR)/references.bib

ifneq "$(shell pandoc --version | grep ^pandoc | sed 's/^.* //g')" "$(shell cat pandoc_version)"
	OLDVER = pandoc_version $(STYLEDIR)/template.tex
endif

pdf: $(OUTPUTFILE)

tex: $(OUTPUTDIR)/thesis.tex

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make tex	                       generate a Latex file 			  '
	@echo '                                                                       '
	@echo ' 																	  '


$(OUTPUTFILE): $(STYLEDIR)/* $(INPUTDIR)/* $(OLDVER)
	@pandoc \
	"$(STYLEDIR)/template.yaml" "$(INPUTDIR)/metadata.yaml" "$(INPUTDIR)"/*.md \
	-o "$@" \
	--from=markdown-auto_identifiers \
	--template="$(STYLEDIR)/template.tex" \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/apa_ko.csl" \
	--highlight-style pygments \
	--top-level-division=chapter \
	-N \
	--columns=32 --wrap=preserve \
	--pdf-engine=xelatex \
	--filter pandoc-crossref \
	--lua-filter multiple-bibliographies.lua \
	&& ls -l "$(OUTPUTDIR)/$(STDNO)-$(FULLNAME)-Thesis.pdf"\
	|| cat pandoc.log

$(OUTPUTDIR)/thesis.tex: $(STYLEDIR)/* $(INPUTDIR)/* $(OLDVER)
	pandoc "$(STYLEDIR)/template.yaml" "$(INPUTDIR)/metadata.yaml" "$(INPUTDIR)"/*.md \
	-o "$@" \
	--from=markdown-auto_identifiers \
	--template="$(STYLEDIR)/template.tex" \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/apa_ko.csl" \
	--highlight-style pygments \
	--top-level-division=chapter \
	-N \
	--columns=32 --wrap=preserve \
	--pdf-engine=xelatex \
	--filter pandoc-crossref \
	--lua-filter multiple-bibliographies.lua


$(STYLEDIR)/template.tex:
	pandoc -D latex > "$(STYLEDIR)/default.tex"
	sed $$'/.*for.*include-before.*/{e cat "$(STYLEDIR)/template.before.tex"\n}' "$(STYLEDIR)/default.tex" > "$@"
	sed -i 's/\(usepackage{.*\)grffile/\1/' "$@"

pandoc_version:
	pandoc --version | grep ^pandoc | sed 's/^.* //g' > $@

.PHONY: help pdf tex $(OLDVER)
