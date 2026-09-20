initial
begin
	reset;

	write(12'h4,32'hffff,4'b1111);
	read(12'h4);

	if (read_data == 32'hffff)
		$display("1Pass write: Pass");
	else
		$display("1Pass write: Fail");

	reset;

	write(12'h14, 32'h1,4'b1111);
	write(12'hC, 32'd255,4'd15);
	write(12'h10, 32'h0,4'd15);
	write(12'h0, 32'h1,4'd15);
	@(posedge sys_clk);
	repeat (255) @(posedge sys_clk);
	if (tim_int == 1'b1)
		$display("1Pass interrupt: Pass");
	else
		$display("1Pass interrupt: Fail");
	#100;
	reset;

	write(12'h0, 32'hffff_ffff,4'd15);
	read(12'h0);

	write(12'h0, 32'h5555_5555,4'd15);
	read(12'h0);

	write(12'h0, 32'hAAAA_AAAA,4'd15);
	read(12'h0);






	#100;

	$finish;
end

