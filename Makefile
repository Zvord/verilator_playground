.PHONY: build

VERILATOR_ROOT=/nfs/users/ibarkov/soft/verilator
export CC=/usr/lib64/ccache/clang
export CXX=usr/lib64/ccache/clang++
BIN=Vtop

build:
	$(VERILATOR_ROOT)/bin/verilator -F list/filelist.f --cc --binary --timing --compiler clang -o $(BIN) -O0

run:
	./obj_dir/$(BIN)

version:
	$(VERILATOR_ROOT)/bin/verilator --version
