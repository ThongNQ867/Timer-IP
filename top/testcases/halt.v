initial
begin
	check = 0;

	$display("dbg_mode = 1");
//Debug_mode = 1
//Default mode
	reset;
	dbg_mode = 1'b1;
	tim_def_en;
	repeat (255) @(posedge sys_clk);
	write(12'h1C, 32'h1, 4'b1111);
	@(posedge sys_clk);
	if(dut.register0.THCSR[1] != 1'b1)
	begin
		check = check +1;
		$display("DEF-ERROR: HALT ACK NOT ASSERTED");
	end

	if(dut.register0.TDR0!= 258 )
	begin
		check = check +1;
		$display("DEF-ERROR: WRONG COUNT VALUE AFTER HALTED, %h", dut.register0.TDR0);
	end
	i = dut.register0.TDR0;

	repeat (255) @(posedge sys_clk);
	if( dut.register0.TDR0 != i)
	begin
		check = check +1;
		$display("DEF-ERROR: COUNTING DOESNT STOP IN HALTED MODE");
	end
	i = dut.register0.TDR0;
	write(12'h1C, 32'h0, 4'b1);
	@(posedge sys_clk);
	repeat (20) @(posedge sys_clk);
	if(dut.register0.TDR0 != (i+20))
	begin
		check = check +1;
		$display("DEF-ERROR: COUNTER DOESNT MATCH EXPECTED VALUE");
	end
	if(dut.register0.TDR0 == i)
	begin
		check = check +1;
		$display("DEF-ERROR: COUNTER DOESNT CONTINUE AFTER STOP HALTED MODE");
	end

	read(12'h1C);
	if(read_data != 32'h0)
	begin
		check = check +1;
		$display("DEF-ERROR: HATL ACK NOT RESET AT HALT REQ LOW");
	end

//control mode

	reset;
	change_count_speed(4'b10);//div_val = 4;
	tim_con_en;
	repeat(200) @(posedge sys_clk);
	write(12'h1C, 32'h1, 4'b1);
	@(posedge sys_clk);
	if(dut.register0.THCSR[1] != 1'b1)
	begin
		check = check +1;
		$display("CON-ERROR: HALT ACK NOT ASSERTED");
	end

	if(dut.register0.TDR0 != 32'd50)
	begin
		check = check +1;
		$display("CON-ERROR: WRONG COUNT VALUE AFTER HALTED");
	end



	i = dut.register0.TDR0;

	repeat (255) @(posedge sys_clk);
	if( dut.register0.TDR0 != i)
	begin
		check = check +1;
		$display("CON-ERROR: COUNTING DOESNT STOP IN HALTED MODE");
	end
	i = dut.register0.TDR0;
	write(12'h1C, 32'h0, 4'b1);
	@(posedge sys_clk);
	repeat (20) @(posedge sys_clk);
	if(dut.register0.TDR0 != (i+5))
	begin
		check = check +1;
		$display("CON-ERROR: COUNTER DOESNT MATCH EXPECTED VALUE");
	end
	if(dut.register0.TDR0 == i)
	begin
		check = check +1;
		$display("CON-ERROR: COUNTER DOESNT CONTINUE AFTER STOP HALTED MODE");
	end

	read(12'h1C);
	if(read_data != 32'h0)
	begin
		check = check +1;
		$display("CON-ERROR: HATL ACK NOT RESET AT HALT REQ LOW");
	end

//
$display("dbg_mode = 0");
dbg_mode = 1'b0;
reset;
tim_def_en;
repeat (255) @(posedge sys_clk);
	write(12'h1C, 32'h1, 4'b1);
	@(posedge sys_clk);
	if(dut.register0.THCSR[1] != 1'b0)
	begin
		check = check +1;
		$display("DEF-ERROR: HALT ACK  ASSERTED");
	end

	i = dut.register0.TDR0;

	repeat (255) @(posedge sys_clk);
	if(dut.register0.TDR0 == i)
	begin
		check = check +1;
		$display("DEF-ERROR: WRONG COUNT VALUE");
	end

//Control mode

	reset;
	dbg_mode = 1'b0;
	change_count_speed(4'b10);//div_val = 4;
	tim_con_en;
	repeat(200) @(posedge sys_clk);
	write(12'h1C, 32'h1, 4'b1);
	@(posedge sys_clk);

	if(dut.register0.THCSR[1] != 1'b0)
	begin
		check = check +1;
		$display("CON-ERROR: HALT ACK  ASSERTED");
	end

	i = dut.register0.TDR0;

	repeat (255) @(posedge sys_clk);
	if(dut.register0.TDR0 == i)
	begin
		check = check +1;
		$display("CON-ERROR: WRONG COUNT VALUE");
	end









if ( check ==0)
	$display("HALT PASS");
else
	$display("HALT FAIL");


	$finish;
end

