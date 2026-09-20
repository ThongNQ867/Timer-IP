initial 
begin
	reset;
	check = 0;

	read(12'h0);
	if (read_data != 32'h100)
	begin
		$display("TCR reset fail");
		check = check +1;
	end
	read(12'h4);
	if (read_data != 32'h0)
	begin
		$display("TDR0 reset fail");
		check = check +1;
	end

	read(12'h8);
	if (read_data != 32'h0)
	begin
		$display("TDR1 reset fail");
		check = check +1;
	end

	read(12'hC);
	if (read_data != 32'hFFFF_FFFF)
	begin
		$display("TCMP0 reset fail");
		check = check +1;
	end

	read(12'h10);
	if (read_data != 32'hFFFF_FFFF)
	begin
		$display("TCMP1 reset fail, %h",tim_prdata);
		check = check +1;
	end


	read(12'h14);
	if (read_data != 32'h0)
	begin
		$display("TIER reset fail");
		check = check +1;
	end

	read(12'h18);
	if (read_data != 32'h0)
	begin
		$display("TISR reset fail");
		check = check +1;
	end


	read(12'h1C);
	if (read_data != 32'h0)
	begin
		$display("THCSR reset fail");
		check = check +1;
	end

	if( check == 0)
		$display("RESET PASS");
	else
		$display("RESET FAIL");

	$finish;

end
