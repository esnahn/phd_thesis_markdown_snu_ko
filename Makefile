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

BIBFILE=$(INPUTDIR)/references.bib

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make template                    rebuild latex template             '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make tex	                       generate a Latex file 			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
	@echo 'get local templates with: pandoc -D latex/html/etc	  				  '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates		  '

template:

	pandoc -D latex > "$(STYLEDIR)/default.tex"
	sed $$'/.*for.*include-before.*/{e cat "$(STYLEDIR)/template.before.tex"\n}' "$(STYLEDIR)/default.tex" > "$(STYLEDIR)/template.tex"
	sed -i 's/\(usepackage{.*\)grffile/\1/' "$(STYLEDIR)/template.tex"

tex:
	pandoc "$(STYLEDIR)/template.yaml" "$(INPUTDIR)/metadata.yaml" "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.tex" \
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
	
pdf:
	@pandoc \
	"$(STYLEDIR)/template.yaml" "$(INPUTDIR)/metadata.yaml" "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/$(STDNO)-$(FULLNAME)-Thesis.pdf" \
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

md:
	pandoc "$(STYLEDIR)/template.yaml" "$(INPUTDIR)/metadata.yaml" "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/$(STDNO)-$(FULLNAME)-Thesis.md" \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/apa_ko.csl" \
	--highlight-style pygments \
	--top-level-division=chapter \
	-N \
	--pdf-engine=xelatex \
	--filter pandoc-crossref \
	--lua-filter multiple-bibliographies.lua 

.PHONY: help pdf tex
