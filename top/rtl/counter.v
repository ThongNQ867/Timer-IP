module counter(
	input wire sys_clk,
	input wire sys_rst_n,
	input wire cnt_en,
	input wire [31:0] TDR0,
	input wire [31:0] TDR1,
	output wire[63:0]  cnt
);
wire [63:0] cnt_in;


assign cnt_in = {TDR1,TDR0};

assign cnt = (cnt_en) ? cnt_in + 1 : cnt_in;


endmodule

