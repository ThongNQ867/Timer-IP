initial 
begin
	reset;
	check = 0;
	change_count_speed(4'b0000);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd512)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	change_count_speed(4'b1);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd256)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	change_count_speed(4'b10);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd128)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	check = 0;
	change_count_speed(4'd3);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd64)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	change_count_speed(4'd4);
	//$display("TCR: %h", dut.register0.TCR);	//
	//@(posedge sys_clk);
	//$display("1TCR: %h", dut.register0.TCR);
	tim_con_en;
	//@(posedge sys_clk);
	//$display("2TCR: %h", dut.register0.TCR);
	repeat(512+1) @(posedge sys_clk);
	//$display("3TCR: %h", dut.register0.TCR);
	if ( dut.register0.TDR0 != 32'd32)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	change_count_speed(4'd5);
	//$display("TCR: %h", dut.register0.TCR);	//
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	//$display("2TCR: %h", dut.register0.TCR);
	if ( dut.register0.TDR0 != 32'd16)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	check = 0;
	change_count_speed(4'd6);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd8)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	change_count_speed(4'd7);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd4)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end

	reset;
	change_count_speed(4'd8);
	tim_con_en;
	repeat(512+1) @(posedge sys_clk);
	if ( dut.register0.TDR0 != 32'd2)
	begin
		check = check +1;
		$display("Error div_val = %b, TDR0 = %d",dut.register0.div_val, dut.register0.TDR0);
	end



	if( check ==0)
		$display("COUNT CONTROL PASS");
	else
		$display("COUNT CONTROL FAIL");

	$finish;
end

