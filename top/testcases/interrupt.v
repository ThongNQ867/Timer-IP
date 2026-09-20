initial
begin
	reset;
	check = 0;
	i = $urandom_range(32'hff, 32'h0000_ffff);
	write(12'hC, i, 4'b1111);
	write(12'h10, 32'h0, 4'b1111);
	int_enable;
	tim_def_en;
	repeat(i+1) @(posedge sys_clk);
	if(tim_int != 1'b1)
	begin
		check = check +1;
		$display("Interrupt set error");
	end
	read(12'h18);
	if( read_data !=  32'h1)
	begin
		check = check +1;
		$display("Interrupt status set error");
	end

	tim_def_dis;
	repeat(5) @(posedge sys_clk);
	if(tim_int != 1'b1)
	begin
		check = check +1;
		$display("Error : interrupt need to stay up before reset");
	end
	read(12'h18);
	if( read_data !=  32'h1)
	begin
		check = check +1;
		$display("Error : interrupt status need to stay up before reset");
	end

	write(12'h18, 32'h0,4'b1111);
	@(posedge sys_clk);
	if(tim_int != 1'b1)
	begin
		check = check + 1;
		$display("Error: Int_st is not RW1C");
	end

	write(12'h18, 32'h1,4'b1000);
	@(posedge sys_clk);
	if(tim_int != 1'b1)
	begin
		check = check + 1;
		$display("Error: in_st is reset when ptrb is not correct");
	end



	write (12'h18, 32'h1, 4'b1111);
	@(posedge sys_clk);

	if(tim_int != 1'b0)
	begin
		check = check +1;
		$display("Error : interrupt reset error");
	end
	read(12'h18);
	if( read_data !=  32'h0)
	begin
		check = check +1;
		$display("Error : interrupt status reset error");
	end

// int_en = 0;

	reset;
	i = $urandom_range(32'hff, 32'h0000_ffff);
	write(12'hC, i, 4'b1111);
	write(12'h10, 32'h0, 4'b1111);
	tim_def_en;
	repeat(i) @(posedge sys_clk);
	if(tim_int != 1'b0)
	begin
		check = check +1;
		$display("Interrupt masking set error");
	end
	read(12'h18);
	if( read_data !=  32'h1)
	begin
		check = check +1;
		$display("Interrupt status set error");
	end

	if (check == 0)
		$display("INTERRUPT PASS");
	else
		$display("INTERRUPT FAIL");





	$finish;
end

