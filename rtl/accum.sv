module accum(
	input [31:0] val,
// ! Verilator complains about set being a C++ keyword (though it's only a warning)
	input logic set_val,
	input logic clk,
	input logic rst_n,
	output logic [63:0] acc
	);

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			acc <= 0;
		end else begin
			if (set_val)
				acc <= 64'(val);
			else
				acc <= acc + 64'(val);
		end
	end
endmodule
