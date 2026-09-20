`timescale 1ns/1ns
module test_bench;

	reg sys_clk;
	reg sys_rst_n;
	reg tim_psel;
	reg tim_pwrite;
	reg tim_penable;
	reg [11:0] tim_paddr;
	reg [31:0] tim_pwdata;
	reg [3:0] tim_pstrb;
	reg dbg_mode;

	wire [31:0] tim_prdata;
	wire tim_pready;
	wire tim_pslverr;
	wire tim_int;

timer_top dut(.*);

initial
begin
	sys_clk = 1'b0;
	forever #25 sys_clk = ~sys_clk;
end

integer i;
integer check ;
reg[31:0] read_data;

initial
begin
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;
	tim_paddr = 0;
	tim_pwdata = 0;
	tim_pstrb = 0;
end

`include "run_test.v"


task reset;
	begin
	sys_rst_n = 1'b0;
	#25;
	sys_rst_n = 1'b1;
	end
endtask

task write;
		input [11:0] write_addr;
		input [31:0] write_data;
		input [3:0] strobe;
		begin
			//@(posedge sys_clk);
			tim_pstrb = strobe;
			tim_paddr = write_addr;
			tim_pwrite = 1'b1;
			tim_psel = 1'b1;
			tim_pwdata = write_data;
			@(posedge sys_clk);
			tim_penable = 1'b1;
			wait (tim_pready == 1'b1);
			@(posedge sys_clk);
			tim_psel = 0;
			tim_penable = 0;
			tim_pwrite = 0;
	

		end
	endtask

task read;
		input [11:0] read_addr;
		begin
			tim_paddr = read_addr;
			tim_psel = 1'b1;
			@(posedge sys_clk);
			tim_penable = 1'b1;
			@(posedge tim_pready);
			#1;
			read_data = tim_prdata;
			@(posedge sys_clk);
			tim_psel = 0;
			tim_penable = 0;
		end
	endtask

task tim_def_en;
	write(12'h0, 32'h1, 4'b1);
endtask

task tim_def_dis;
	write(12'h0, 32'h0, 4'b1);
endtask

task tim_con_en;
	write(12'h0, 32'h3, 4'b1);
endtask

task tim_con_dis;
	write(12'h0, 32'h2, 4'b1);
endtask

task change_count_speed;//only use in control mode
	input [3:0] div_val;
	begin
		write(12'h0, {20'h0,div_val,8'h0}, 4'b0010);
	end
endtask
task int_enable;
	write(12'h14, 32'h1, 4'b1111);
endtask

task int_disable;
	write(12'h14, 32'h0, 4'b1111);
endtask



endmodule

