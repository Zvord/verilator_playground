module tb_top;

	import uvm_pkg::*;

	logic clk;
	logic rst_n;
	logic set_val;
	logic [31:0] val;
	logic [63:0] acc;

	always #1 clk <= ~clk;

	initial begin
		// Initialize signals
		clk = 0;
		rst_n = 0;

		// Set up VCD dump
		$dumpfile("tb.vcd");
		$dumpvars(0, tb_top);

		#10;
		rst_n = 1;
	end

	accum dut (.*);
	simple_if vif(.*);

	initial begin
		uvm_config_db#(virtual simple_if)::set(uvm_root::get(), "*.agent.*", "vif", vif);
	end

	initial begin
		run_test("simple_test");
	end
endmodule
