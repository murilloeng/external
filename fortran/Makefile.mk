#mode
!IF "$(m)" != "r"
mode = debug
!ELSE
mode = release
!ENDIF

#platform
!IF "$(PROCESSOR_ARCHITECTURE)" == "x86"
platform = x86
!ELSE
platform = x64
!ENDIF

#flags
flags_linker = /nologo
flags_compiler = /nologo /c /Zl /module:$(directory)\ /object:$(directory)\ 

#directory
directory = lib\$(platform)\$(mode)

#libraries
quadrule = $(directory)\quadrule.lib

#rules
all : setup $(quadrule)
	@echo build complete!

setup : 
	@if not exist $(directory) mkdir $(directory)

$(quadrule) :
	@echo $@
	@ifort $(flags_compiler) src\quadrule.f90
	@lib $(flags_linker) /out:$(directory)\quadrule.lib $(directory)\quadrule.obj

clean : 
	@echo cleaned $(platform)\$(mode)!
	@if exist $(directory) rmdir /s /q $(directory)