 
# pd ratfor77 (oz)
#
# if F77 is defined, the output
# of ratfor is Fortran 77.
#
#	On sun4,		use S_CHAR="char"
#	On RS6000,		use S_CHAR="signed char"
#	On DEC3100,	maybe	use S_CHAR="signed char"
#	On CRAY,		use S_CHAR="char"
#	On GNU,		        use S_CHAR="char"
#

EXTRA_DISTR_FILES = getopt.c  lookup.c  lookup.h  rat4.c ratcom.h   ratdef.h


SIGNED_CHAR="char"
CC=cc


# we don't want the standard SEP flags so override them
ifeq ($(GNU),yes)
OCDEFINES := -c -DF77 -DS_CHAR=$(SIGNED_CHAR) -DGNU
else
OCDEFINES := -c -DF77 -DS_CHAR=$(SIGNED_CHAR)
endif

ALL= $(SEPBINDIR)/ratfor77

all: ${ALL}
	@echo "Done making all in util/tools/ratfor77"
 
deinstall:
	$(RM) $(SEPBINDIR)/ratfor77
#
ratfor77:	rat4.o lookup.o getopt.o 
	cc  rat4.o lookup.o getopt.o  -o ratfor77

%.o:	%.c
	${CC}	${OCDEFINES} $*.c -o$*.o
	
