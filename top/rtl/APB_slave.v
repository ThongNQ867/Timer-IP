module APB_slave (
	input wire  sys_clk,
	input wire sys_rst_n,
	//APB signals
	input wire tim_psel,
	input wire tim_pwrite,
	input wire  tim_penable,
	//input wire [11:0] tim_paddr,
	input wire [31:0] tim_pwdata,
	input wire [3:0] tim_pstrb,
	//input from TCR
	input wire div_enable, 
	input wire [3:0] div_value,
	input wire TCR_select,
	input wire tim_enable,
	

	//Output to register
	output reg wr_en,
	output reg rd_en,

	//Output
	output wire tim_pready,
	output wire tim_pslverr
);

wire div_val_change_error, div_en_change_error, invalid_div_val_error;

wire tim_en, TCR_sel, div_en;
wire [3:0] div_val;

assign tim_en = tim_enable;
assign div_en = div_enable;
assign TCR_sel = TCR_select;
assign div_val = div_value;

//Error: Change value while timer on
assign div_val_change_error = ( tim_en && (tim_pwdata[11:8] != div_val) && tim_pstrb[1]);

//Error: Change count mode when timer
assign div_en_change_error = ( tim_en && (tim_pwdata[1] != div_en) && tim_pstrb[0] );

//Error3: invalid div_val value
assign invalid_div_val_error = ( (tim_pwdata[11:8] > 4'h8 ) && tim_pstrb[1] );


assign tim_pslverr = (  ( div_val_change_error || div_en_change_error || invalid_div_val_error) && TCR_sel);

wire wr_en_pre, rd_en_pre;


always @(posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
	begin
		wr_en <= 1'b0;
	end
	else 
	begin
		wr_en <= wr_en_pre;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
	begin
		rd_en <= 1'b0;
	end
	else 
	begin
		rd_en <= rd_en_pre;
	end
end

assign wr_en_pre = ( (~wr_en) &&  tim_psel && tim_penable && tim_pwrite);
assign rd_en_pre = ( (~rd_en) &&  tim_psel && tim_penable &&(~tim_pwrite));

assign tim_pready = (wr_en || rd_en);

endmodule


