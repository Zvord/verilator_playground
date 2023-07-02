.PHONY: build run version clean

BIN=Vtop

clean:
	rm -rf obj_dir

build:
	$(VERILATOR_ROOT)/bin/verilator -F list/filelist.f --cc --binary --timing --compiler clang -o $(BIN) -O0

run:
	./obj_dir/$(BIN)

version:
	$(VERILATOR_ROOT)/bin/verilator --version
