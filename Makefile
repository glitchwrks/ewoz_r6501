SHELL		:= /bin/bash

AFLAGS		= -t none
LFLAGS		= -t none
RMFLAGS		= -f

CC		= cc65
CA		= ca65
CL		= cl65
RM		= rm

all: ewoz.hex

ewoz.hex: ewoz.bin
	srec_cat ewoz.bin -binary -offset=0x8000 -o ewoz.hex -intel -address-length=2

ewoz.bin: ewoz.o
	$(CL) $(LFLAGS) -C gw-r65x1qsbc-1.cfg -o ewoz.bin ewoz.o

ewoz.o: ewoz.a65
	$(CA) $(AFLAGS) -l ewoz.lst -o ewoz.o ewoz.a65

clean:
	$(RM) $(RMFLAGS) *.o *.bin *.hex *.lst

distclean: clean
