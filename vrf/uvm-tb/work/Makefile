.PHONY: build run version clean

BIN=Vtop

PROJ=$(shell realpath ../../../)
TB=$(PROJ)/vrf/uvm-tb
RTL=$(PROJ)/rtl
UVM_HOME?=$(PROJ)/uvm

export TB
export RTL
export UVM_HOME

NPROC=16

# Without --debug it has internal error
# NO_DPI prevents linkage error
BUILD_OPTS = \
	$(OPTS) \
	--output-groups $(NPROC) \
	-DUVM_NO_DPI \
	--timescale 1ns/1ps \
	--cc \
	--binary \
	--timing \
	-O3 \
	-j $(NPROC) \
	-Wno-lint \
	-Wno-style \
	-Wno-SYMRSVDWORD \
	-Wno-IGNOREDRETURN \
	-Wno-CONSTRAINTIGN \
	-Wno-ZERODLY \
	-o $(BIN)

clean:
	rm -rf obj_dir

build:
	$(VERILATOR_ROOT)/bin/verilator $(BUILD_OPTS) -F $(TB)/list/filelist.f

run:
	./obj_dir/$(BIN)

version:
	$(VERILATOR_ROOT)/bin/verilator --version
