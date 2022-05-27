
SITE    := public
INSTRS 	:= clarinet horn percussion trumpet violin cello flute trombone viola
TARGETS := $(INSTRS:%=$(SITE)/%.html)

INSCORE := inscore
INSTR	:= $(shell echo $(PART) | tr [A-Z] [a-z])
TARGET  := $(SITE)/$(INSTR).html
TMPL 	:= rsrc/template.html

all:
	make -C $(SITE)/pages all
	make -C $(SITE)/inscore
	make $(SITE)/clarinet.html PART=Clarinet 
	make $(SITE)/horn.html PART=Horn 
	make $(SITE)/percussion.html PART=Percussion 
	make $(SITE)/trumpet.html PART=Trumpet 
	make $(SITE)/violin.html PART=Violin 
	make $(SITE)/cello.html PART=Cello 
	make $(SITE)/flute.html PART=Flute 
	make $(SITE)/trombone.html PART=Trombone 
	make $(SITE)/viola.html PART=Viola 

$(TARGET) : $(TMPL) Makefile
	cat $(TMPL) | sed -e "s/PART/$(PART)/g" | sed -e "s/INSTR/$(INSTR)/g"  > $@

help:
	@echo "Build the html pages for all instruments"
	@echo "Usage: "
	@echo "   make all             # to build all instruments"
	@echo "   make TARGET=instr    # to build a single instrument"
	@echo "                        # where instr is an instrument name"
	@echo "   make install         # install the required libraries"

install:
	npm install
	cp node_modules/@grame/libfaust/libfaust-wasm.js    $(SITE)/lib
	cp node_modules/@grame/libfaust/libfaust-wasm.wasm  $(SITE)/lib
	cp node_modules/@grame/libfaust/FaustLibrary.js  	$(SITE)/lib
	cp node_modules/@grame/libfaust/libfaust-wasm.data  $(SITE)
	cp node_modules/@grame/inscorejs/INScoreJS.js 		$(SITE)/lib
	cp node_modules/@grame/inscorejs/libINScore.js 		$(SITE)/lib
	cp node_modules/@grame/inscorejs/libINScore.wasm 	$(SITE)/lib
	cp node_modules/timesync/dist/timesync.min.js		$(SITE)/lib


clean:
	rm -f $(TARGETS)
	make -C $(SITE)/inscore clean
