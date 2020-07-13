#    YAR Writer, Resume Generator 
#    Copyright(C)2020 John Hart <john@hackade.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#	Author: John Hart <john@hackade.com>
DIST = ../dist
CONF = ./conf
FILE = resume
STYLE_SHEET = resume_style
MINIFLAGS = --collapse-whitespace --remove-comments --remove-tag-whitespace --minify-css true --minify-js true --no-html5  --process-conditional-comments   --use-short-doctype --remove-tag-whitespace
TEX = /Library/TeX/texbin/xetex
TEXFLAGS = --halt-on-error -shell-escape -output-driver="xdvipdfmx -z 0"


VERSION = `source $(CONF)/version.sh`

all: html
	echo Completed building resume base version ${VERSION}

qr: 
	qrencode -o qr_$(FILE).png https://hart.pw/resume.html\?ver\=$(VERSION)
	convert qr_$(FILE).png qr_$(FILE).eps	

preprocess:
	m4 $(CONF)/preprocess.m4 $(CONF)/$(STYLE_SHEET).in > $(STYLE_SHEET).tex	

dvi: preprocess qr
	$(TEX) --output-format=dvi $(TEXFLAGS) $(FILE).tex
	dvisvgm $(FILE).xdv

pdf: preprocess qr
	$(TEX) $(TEXFLAGS) $(FILE).tex
	
html:  	pdf
	pdf2htmlEX ./$(FILE).pdf
	html-minifier $(MINIFLAGS) ./$(FILE).html > $(FILE).min.html

dist: html pdf 
	mkdir -p $(DIST)
	cp -R $(FILE).min.html $(DIST)/$(FILE).html
	cp -R $(FILE).pdf $(DIST)

clean:
	rm -f $(FILE).aux $(FILE)*.log $(FILE)*.toc $(FILE)*.dvi 
	rm -f $(FILE)*.bbl $(FILE)*.out $(FILE)*.blg $(FILE)*.idx 
	rm -f $(FILE)*.ilg $(FILE)*.ind $(FILE)*.idv $(FILE)*.lg qr_$(FILE).*

distclean: clean
	rm -f *.pdf *.html $(STYLE_SHEET).tex

.PHONY: clean distclean dist html pdf dvi preprocess qr all $(STYLE_SHEET).tex
