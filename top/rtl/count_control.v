module count_control (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire tim_enable,
	input wire div_enable,
	input wire halt_acknowledge,
	input wire halt_acknowledge_pre,
	input wire [3:0] div_value,
	output wire cnt_en
);

wire tim_en, div_en;
assign tim_en = tim_enable;
assign div_en = div_enable;

reg [7:0] limit;

always @(*)
begin
	case (div_value)
		4'b0000:
			limit = 8'd0;
		4'b0001:
			limit = 8'd1;
		4'b0010:
			limit = 8'd3;
		4'b0011:
			limit = 8'd7;
		4'b0100:
			limit = 8'd15;
		4'b0101:
			limit = 8'd31;
		4'b0110:
			limit = 8'd63;
		4'b0111:
			limit = 8'd127;
		4'b1000:
			limit = 8'd255;
		default: limit = 8'd1;
	endcase
end

wire control_mode;
assign control_mode = tim_en && div_en;

reg [7:0] int_cnt;
wire [7:0] int_cnt_pre;


wire cnt_en_pre; 

assign cnt_en_pre = ( (int_cnt == limit) && control_mode);

assign int_cnt_pre = cnt_en_pre ? 8'b0 :(	 (control_mode && (~halt_acknowledge_pre))	? (int_cnt + 1) : int_cnt	);

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n || (!tim_enable))
		int_cnt <= 8'b0;
	else
		int_cnt <= int_cnt_pre;
end

assign cnt_en =	(	 (  (tim_en && (~div_en)) ||  cnt_en_pre ) && (~halt_acknowledge)  );

				
//assign cnt_en =	(	 (  (tim_en && (~div_en)) ||  cnt_en_pre ) 	&&	(~halt_acknowledge) );
endmodule



