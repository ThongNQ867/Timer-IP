module register(
	input wire sys_clk,
	input wire sys_rst_n,


	input wire [11:0] tim_paddr,
	input wire [31:0] tim_pwdata,
	input wire [3:0] tim_pstrb,
	input wire dbg_mode,

	input wire wr_en,
	input wire rd_en,

	input wire [63:0] cnt,

	input wire error,

	output wire tim_int,
	//Output to APB slave
	output wire [3:0] div_value,
	output wire div_enable,
	output wire tim_enable,
	output wire TCR_select,
	output wire [31:0]  tim_prdata,
	//Output to counter control
	//already include div_val, div_en, tim_en, 
	output wire halt_acknowledge,
	output wire halt_acknowledge_pre,

	//Output to register
	output wire [31:0] TDR0,
	output wire [31:0] TDR1


);

wire [31:0] TCR, TISR, TIER, THCSR, TCMP0, TCMP1;


// TCR

wire TCR_sel, tim_en_pre, div_en_pre;
wire [3:0] div_val_pre;
reg tim_en, div_en;
reg [3:0] div_val;
//assign output
assign div_value = div_val;
assign tim_enable = tim_en;
assign TCR_select = TCR_sel;
assign div_enable = div_en;
assign TCR_sel =( (tim_paddr == 12'h0) && wr_en);


assign tim_en_pre = (TCR_sel && tim_pstrb[0]) ? tim_pwdata[0] : tim_en;
assign div_en_pre = (TCR_sel && tim_pstrb[0] && (~tim_en))  ? tim_pwdata[1] : div_en;
assign div_val_pre = (TCR_sel && tim_pstrb[1] && (~tim_en) && (tim_pwdata[11:8] < 4'b1001) ) ? tim_pwdata[11:8] : div_val;

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
	begin
		tim_en <= 1'b0;
	end
	else
		if(! error)
	begin
		tim_en <= tim_en_pre;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
	begin
		div_en <= 1'b0;
	end
	else
		if (!error)
	begin
		div_en <= div_en_pre;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
	begin
		div_val = 4'b0001;
	end
	else
		if(!error)
	begin
		div_val = div_val_pre;
	end
end

assign TCR = {20'h0, div_val, 6'h0, div_en, tim_en};


//TDR0
wire TDR0_sel;
assign TDR0_sel =( (tim_paddr == 12'h4) && wr_en);

wire [31:0] TDR0_pre;
reg [31:0] TDR0_reg;

assign TDR0_pre [7:0] = (TDR0_sel && tim_pstrb[0]) ? tim_pwdata[7:0] :
       ((tim_en&& !halt_acknowledge) ?  cnt[7:0]  :  TDR0_reg[7:0]);

assign TDR0_pre [15:8] = (TDR0_sel && tim_pstrb[1]) ? tim_pwdata[15:8] :
       ((tim_en&& !halt_acknowledge) ?  cnt[15:8] :	TDR0_reg[15:8]);

assign TDR0_pre [23:16] = (TDR0_sel && tim_pstrb[2]) ? tim_pwdata[23:16] :
       ((tim_en&& !halt_acknowledge) ?  cnt[23:16] :	TDR0_reg[23:16]);

assign TDR0_pre [31:24] = (TDR0_sel && tim_pstrb[3]) ? tim_pwdata[31:24] :
       ( (tim_en&& !halt_acknowledge) ?  cnt[31:24] :	TDR0_reg[31:24]);

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n || ((~tim_en_pre) && tim_en) )
		TDR0_reg  <= 32'b0;
	else
		TDR0_reg  <= TDR0_pre;
end


assign TDR0 = TDR0_reg;

//TDR1
wire TDR1_sel;
assign TDR1_sel =( (tim_paddr == 12'h8) && wr_en);

wire [31:0] TDR1_pre;
reg [31:0] TDR1_reg;

assign TDR1_pre [7:0] = (TDR1_sel && tim_pstrb[0]) ? tim_pwdata[7:0] :
       (tim_en ?  cnt[39:32] :	TDR1_reg[7:0]);

assign TDR1_pre [15:8] = (TDR1_sel && tim_pstrb[1]) ? tim_pwdata[15:8] :
       (tim_en ?  cnt[47:40] :	TDR1_reg[15:8]);

assign TDR1_pre [23:16] = (TDR1_sel && tim_pstrb[2]) ? tim_pwdata[23:16] :
       (tim_en ?  cnt[55:48] : TDR1_reg[23:16]);

assign TDR1_pre [31:24] = (TDR1_sel && tim_pstrb[3]) ? tim_pwdata[31:24] :
       (tim_en ?  cnt[63:56] :	TDR1_reg[31:24]);

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n	|| ( (~tim_en_pre) && tim_en) )
		TDR1_reg  <= 32'b0;
	else
		TDR1_reg  <= TDR1_pre;
end

assign TDR1 = TDR1_reg;
//TCMP0
wire TCMP0_sel;
assign TCMP0_sel =( (tim_paddr == 12'hC) && wr_en);

wire [31:0] TCMP0_pre;
reg [31:0] TCMP0_reg;

assign TCMP0_pre [7:0] = (TCMP0_sel && tim_pstrb[0]) ? tim_pwdata[7:0] : TCMP0_reg[7:0];

assign TCMP0_pre [15:8] = (TCMP0_sel && tim_pstrb[1]) ? tim_pwdata[15:8] : TCMP0_reg[15:8];

assign TCMP0_pre [23:16] = (TCMP0_sel && tim_pstrb[2]) ? tim_pwdata[23:16] : TCMP0_reg[23:16];

assign TCMP0_pre [31:24] = (TCMP0_sel && tim_pstrb[3]) ? tim_pwdata[31:24] : TCMP0_reg[31:24];

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
		TCMP0_reg  <= 32'hFFFF_FFFF;
	else
		TCMP0_reg  <= TCMP0_pre;
end


assign TCMP0 = TCMP0_reg;




//TCMP1

wire TCMP1_sel;
assign TCMP1_sel =( (tim_paddr == 12'h10) && wr_en);

wire [31:0] TCMP1_pre;
reg [31:0] TCMP1_reg;

assign TCMP1_pre [7:0] = (TCMP1_sel && tim_pstrb[0]) ? tim_pwdata[7:0] : TCMP1_reg[7:0];

assign TCMP1_pre [15:8] = (TCMP1_sel && tim_pstrb[1]) ? tim_pwdata[15:8] : TCMP1_reg[15:8];

assign TCMP1_pre [23:16] = (TCMP1_sel && tim_pstrb[2]) ? tim_pwdata[23:16] : TCMP1_reg[23:16];

assign TCMP1_pre [31:24] = (TCMP1_sel && tim_pstrb[3]) ? tim_pwdata[31:24] : TCMP1_reg[31:24];

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
		TCMP1_reg  <= 32'hFFFF_FFFF;
	else
		TCMP1_reg  <= TCMP1_pre;
end


assign TCMP1 = TCMP1_reg;





//TISR
wire TISR_sel;
reg int_st;
wire int_st_pre;

assign TISR_sel =( (tim_paddr == 12'h18) && wr_en);

wire equal;

assign equal = ( (TDR0_pre == TCMP0_pre) && (TDR1_pre == TCMP1_pre));


assign int_st_pre = (TISR_sel && tim_pstrb[0] && tim_pwdata[0]) ? 1'b0 : 
	equal ? 1'b1: int_st;


always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
		int_st <= 1'b0;
	else
		int_st <= int_st_pre;
end

assign TISR = {31'h0, int_st};

//TIER

wire TIER_sel;
assign TIER_sel =( (tim_paddr == 12'h14) && wr_en);

reg int_en;
wire int_en_pre;

assign int_en_pre = (TIER_sel && tim_pstrb[0]) ?tim_pwdata[0] : int_en;

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
		int_en <= 1'b0;
	else
		int_en <= int_en_pre;
end

assign TIER = {31'h0, int_en};


assign tim_int = int_en && int_st;
//THCSR

wire THCSR_sel;
assign THCSR_sel =( (tim_paddr == 12'h1C) && wr_en);

//halt_req
reg halt_req;

//assign outout
//assign halt_request = halt_req;
wire halt_req_pre;

assign halt_req_pre = (THCSR_sel && tim_pstrb[0]) ? tim_pwdata[0] : halt_req;

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
		halt_req  <= 1'b0;
	else
		halt_req <= halt_req_pre;
end


//halt_ack
reg halt_ack;
wire halt_ack_pre;

assign halt_ack_pre = halt_req_pre && dbg_mode;

always @( posedge sys_clk or negedge sys_rst_n)
begin
	if ( !sys_rst_n)
		halt_ack  <= 1'b0;
	else
		halt_ack <= halt_ack_pre;
end
assign halt_acknowledge_pre = halt_ack_pre;
assign halt_acknowledge = halt_ack;
assign THCSR = {30'h0, halt_ack, halt_req};


// Read logic

reg [31:0] rdata;

always @(*)
begin
	if ( rd_en)
	begin
		case (tim_paddr)
			12'h0:
			begin
				rdata = TCR;
			end
			12'h4:
			begin
				rdata = TDR0;
			end
			12'h8:
			begin
				rdata = TDR1;
			end
			12'hC:
			begin
				rdata = TCMP0;
			end
			12'h10:
			begin
				rdata = TCMP1;
			end
			12'h14:
			begin
				rdata = TIER;
			end
			12'h18:
			begin
				rdata = TISR;
			end
			12'h1C:
			begin
				rdata = THCSR;
			end
			default:
			begin
				rdata = 32'h0;
			end

		endcase
	end
	else
	begin
		rdata = 32'h0;
	end
end

assign tim_prdata = rdata;

endmodule
