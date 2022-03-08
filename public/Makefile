
INSTRS 	:= clarinet horn percussion trumpet violin cello flute trombone viola
TARGETS := $(INSTRS:%=%.html)

INSCORE := inscore
INSTR	:= $(shell echo $(PART) | tr [A-Z] [a-z])
TARGET  := $(INSTR).html
TMPL 	:= ../rsrc/template.html

$(TARGET) : $(TMPL) Makefile
	cat $(TMPL) | sed -e "s/PART/$(PART)/g" | sed -e "s/INSTR/$(INSTR)/g"  > $@

help:
	@echo "Build the html pages for all instruments"
	@echo "Usage: "
	@echo "   make all             # to build all instruments"
	@echo "   make TARGET=instr    # to build a single instrument"
	@echo "                        # where instr is an instrument name"

all:
	make -C pages all
	make -C inscore
	make PART=Cello 
	make PART=Clarinet 
	make PART=Flute 
	make PART=Horn 
	make PART=Percussion 
	make PART=Trombone 
	make PART=Trumpet 
	make PART=Viola 
	make PART=Violin 

clean:
	rm -f $(TARGETS)
