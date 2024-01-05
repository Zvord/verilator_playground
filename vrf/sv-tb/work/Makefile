.PHONY: build run version clean

BIN=Vtop

PROJ=$(shell realpath ../../../)
TB=$(PROJ)/vrf/sv-tb
RTL=$(PROJ)/rtl
UVM_HOME?=$(PROJ)/uvm

export TB
export RTL
export UVM_HOME

NPROC=4

BUILD_OPTS = \
	--timescale 1ns/1ps \
	--cc \
	--binary \
	--timing \
	-O3 \
	-j $(NPROC) \
	-o $(BIN)

clean:
	rm -rf obj_dir

build:
	$(VERILATOR_ROOT)/bin/verilator $(BUILD_OPTS) -F $(TB)/list/filelist.f

run:
	./obj_dir/$(BIN)

version:
	$(VERILATOR_ROOT)/bin/verilator --version
