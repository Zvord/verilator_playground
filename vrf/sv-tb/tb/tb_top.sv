module tb_top;

	logic clk;
	logic rst_n;
	logic set_val;
	logic [31:0] val;
	logic [63:0] acc;

	always #1 clk <= ~clk;

	initial begin
		#10;
		rst_n = 1;
	end

	accum dut (.*);
	harness vif(.*);

	driver d;
	monitor m;

	initial begin
		d = new();
		m = new();
		d.vif = vif;
		m.vif = vif;
		$display("Start classes");
		fork
			d.run_phase();
			m.run_phase();
		join_any
		#10;
		$finish;
	end
endmodule
