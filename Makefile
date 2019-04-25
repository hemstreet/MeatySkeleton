# Makefile for OS building

.PHONY: help clean build buildkernel buildlibc headerlog

export PROJECTROOT = $(CURDIR)
export TOOLSDIR = $(PROJECTROOT)/tools

help:
	@echo "Please use 'make <target>' where <target> is on of the following:"
	@echo " clean			to clean all build artifacts"
	@echo " build			to build all projects"
	@echo " buildkernel		to build kernel"
	@echo " buildlibc		to build libc"

clean:
	$(MAKE) headerlog header="Begin cleaning build artifacts"
	bash -c "$(TOOLSDIR)/clean.sh"
	@echo
	@echo

build: clean
	$(MAKE) headerlog header="Begin building all projects."
	bash -c "$(TOOLSDIR)/build.sh"
	@echo
	@echo

buildkernel: clean
	$(MAKE) headerlog header="Begin building kernel."
	bash -c "$(TOOLSDIR)/build.sh kernel"
	@echo
	@echo

buildlibc: clean
	$(MAKE) headerlog header="Begin building libc."
	#$(MAKE) -C libc
	bash -c "$(TOOLSDIR)/build.sh libc"
	@echo
	@echo

headerlog:
	@echo
	@echo
	@echo "====== $(header)"
	@echo
	@echo
