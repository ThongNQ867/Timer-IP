initial
begin
	reset;
	tim_def_en;
	check = 0;

	@(posedge sys_clk);
	tim_pstrb = 4'b1;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'h3;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	
	if (	(tim_pslverr != 1)|| (dut.register0.div_en_pre !=0))
	begin
		check = check +1;
		$display("ERROR response fail: div_en");
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;



	write(12'h0, 32'h0, 4'b1);

	@(posedge sys_clk);
	tim_pstrb = 4'b1;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'h2;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	
	if (	(tim_pslverr != 0)|| (dut.register0.div_en_pre !=1))
	begin
		check = check +1;
		$display("ERROR response fail: div_en");
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;

	write(12'h0, 32'h3, 4'b1);

	@(posedge sys_clk);
	tim_pstrb = 4'b1;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'h1;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	
	if (	(tim_pslverr != 1)|| (dut.register0.div_en_pre !=1))
	begin
		check = check +1;
		$display("ERROR response fail: div_en");
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;


	write(12'h0, 32'h2,4'b1);

	@(posedge sys_clk);
	tim_pstrb = 4'b1;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'h0;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	
	if (	(tim_pslverr != 0)|| (dut.register0.div_en_pre !=0))
	begin
		check = check +1;
		$display("4ERROR response fail: div_en");
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;


//Div_val


	reset;
	//$display("TCR: %h", dut.register0.TCR);
	//change_count_speed(4'b1000);
	//@(posedge sys_clk);
	//$display("TCR: %h", dut.register0.TCR);
	write(12'h0, 32'h3, 4'b1);

	@(posedge sys_clk);
	tim_pstrb = 4'b10;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'h700;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	
	if (	(tim_pslverr != 1)|| (dut.register0.div_val_pre !=4'b1))
	begin
		check = check +1;
		$display("ERROR response fail: div_val");
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;
	@(posedge sys_clk);

	write(12'h0, 32'h2, 4'b1);


	@(posedge sys_clk);
	tim_pstrb = 4'b10;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'h0000_0802;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	if (	(tim_pslverr != 0)|| (dut.register0.div_val_pre !=4'b1000))
	begin
		check = check +1;
		$display("ERROR response fail: div_val, div_val = %h", dut.register0.div_val_pre);
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;
	@(posedge sys_clk);

	reset;
	write(12'h0, 32'h2, 4'b1);
	@(posedge sys_clk);
	tim_pstrb = 4'b10;
	tim_paddr = 12'h0;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'hF00;
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	
	if (	(tim_pslverr != 1)|| (dut.register0.div_val_pre !=4'b1))
	begin
		check = check +1;
		$display("ERROR response fail:invalid div_val");
	end

	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;
	@(posedge sys_clk);


	@(posedge sys_clk);
	tim_pstrb = 4'b1111;
	tim_paddr = 12'h4;
	tim_pwrite = 1'b1;
	tim_psel = 1'b1;
	tim_pwdata = 32'hFFFF_FFFF;
	if (tim_pready)
	begin
		$display("Pready error");
		check = check +1;
	end
	@(posedge sys_clk);
	tim_penable = 1'b1;
	wait (tim_pready == 1'b1);
	@(posedge sys_clk);
	tim_psel = 0;
	tim_penable = 0;
	tim_pwrite = 0;
	@(posedge sys_clk);



	if (check == 0)
		$display("APB PASS");
	else
		$display("APB FAIL");



$finish;
end
