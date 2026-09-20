module timer_top (
	input wire sys_clk,
	input wire sys_rst_n,

	input wire tim_psel,
	input wire tim_pwrite,
	input wire tim_penable,
	input wire [11:0] tim_paddr,
	input wire [31:0] tim_pwdata,
	input wire [3:0] tim_pstrb,
	input wire dbg_mode,

	output wire [31:0] tim_prdata,
	output wire tim_pready,
	output wire tim_pslverr,
	output wire tim_int
);

//APB - regsiter wire
wire wr_en,rd_en;
wire div_enable, TCR_select, tim_enable;
wire [3:0] div_value;
wire error;
assign error = tim_pslverr;
//Counter- register wire
wire [63:0] cnt;

//Counter control - register wire 
wire halt_acknowledge;
wire halt_acknowledge_pre;

//Counter contol - counter wire
wire cnt_en;
wire [31:0]  TDR0, TDR1;
APB_slave        APB_slave0(
.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.tim_psel(tim_psel),
.tim_pwrite(tim_pwrite),
.tim_penable(tim_penable),
.tim_pwdata(tim_pwdata),
.tim_pstrb(tim_pstrb),
.div_enable(div_enable),
.div_value(div_value),
.TCR_select(TCR_select),
.tim_enable(tim_enable),
.wr_en(wr_en),
.rd_en(rd_en),
.tim_pready(tim_pready),
.tim_pslverr(tim_pslverr)
);


count_control	 cnt_ctrl0(
.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.tim_enable(tim_enable),
.div_enable(div_enable),
.halt_acknowledge(halt_acknowledge),
.halt_acknowledge_pre(halt_acknowledge_pre),
.div_value(div_value),
.cnt_en(cnt_en)
);


counter		 counter0(
.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.cnt_en(cnt_en),
.TDR0(TDR0),
.TDR1(TDR1),
.cnt(cnt)
);


register	 register0(
.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.tim_paddr(tim_paddr),
.tim_pwdata(tim_pwdata),
.tim_pstrb(tim_pstrb),
.dbg_mode(dbg_mode),
.wr_en(wr_en),
.rd_en(rd_en),
.cnt(cnt),
.error(error),
.tim_int(tim_int),
.div_value(div_value),
.div_enable(div_enable),
.tim_enable(tim_enable),
.TCR_select(TCR_select),
.tim_prdata(tim_prdata),
.halt_acknowledge(halt_acknowledge),
.halt_acknowledge_pre(halt_acknowledge_pre),
.TDR0(TDR0),
.TDR1(TDR1)
);

endmodule
