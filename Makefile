SHELL := /bin/bash
 
CC		= cc65
CA		= ca65
CL		= cl65
RM		= rm

all: ewoz.hex

ewoz.hex: ewoz.bin
	srec_cat ewoz.bin -binary -offset=0x7000 -o ewoz.hex -intel -address-length=2
	perl -p -e 's/\n/\r\n/' < ewoz.hex > ewoz_crlf.hex

ewoz.bin: ewoz.o
	$(CL) -t none -vm -o ewoz.bin ewoz.o

ewoz.o: ewoz.a65
	$(CA) -g -l ewoz.lst -o ewoz.o ewoz.a65

clean:
	$(RM) *.o *.bin *.hex *.lst

distclean: clean
