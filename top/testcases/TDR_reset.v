initial 
begin

	write(12'h4,32'h0000_ffff,4'b1111);
	write(12'h0,32'h1, 4'b1111);
	repeat($urandom_range(0,255)) @(posedge sys_clk);
	write(12'h0, 32'h0, 4'b1111);
	read(12'h4);
	if ( read_data != 32'h0)
	begin
		$display("TDR reset fail");
	end
	else
	begin
		$display("TDR reset pass");
	end
	#100;
	$finish;
end

