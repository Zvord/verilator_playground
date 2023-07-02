# Verilator Playground

Here I try to show an example of a testbench with Verilator, written purely in SystemVerilog. No hand-written C++ code at all.

Right now there's not much to show. My attempt to use simple driver and monitor classes failed miserable: Verilator doesn't like virtual interfaces, NBAs don't work in classes, even local variable declaration inside a cycle may break the build.
