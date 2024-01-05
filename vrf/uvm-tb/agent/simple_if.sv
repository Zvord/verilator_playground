interface simple_if(
	input clk,
	input rst_n,
	input logic set_val,
	output reg [31:0] val,
	input [63:0] acc
	);

endinterface
