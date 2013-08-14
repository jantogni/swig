MODULE			= example.i
CFILE			= example.c
CWRAPPER		= example_wrap.c
CFILE_O			= example.o
CWRAPPER_O		= example_wrap.o
CFILE_SO		= _example.so
SRC				= ./example/

CHDIR_SHELL := $(SHELL)
define chdir
   $(eval _D=$(firstword $(1) $(@D)))
   $(info $(MAKE): cd $(_D)) $(eval SHELL = cd $(_D); $(CHDIR_SHELL))
endef

main:
	@echo "Compiling Wrapper"
	@$(call chdir,$(SRC))
	@swig -python $(MODULE)
	@cc -c `python-config --cflags` $(CFILE) $(CWRAPPER)
	@cc -bundle `python-config --ldflags` $(CFILE_O) $(CWRAPPER_O) -o $(CFILE_SO)
	@echo "DONE"

clean:
	@$(call chdir,$(SRC))
	@echo "Deleting files"
	@rm -f *.pyc *.o *.so *.py *.cxx example_wrap.*
