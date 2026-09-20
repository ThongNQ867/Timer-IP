initial
begin
check = 0;
//default count
repeat (5)begin
	reset;
	i = $urandom_range(32'hff, 32'h0000_ffff);
	write(12'hC, i, 4'b1111);
	write(12'h10, 32'h0, 4'b1111);
	int_enable;
	tim_def_en;
	repeat(i+1) @(posedge sys_clk);
	if ((dut.register0.TDR0 != dut.register0.TCMP0) && (dut.register0.TDR1 != dut.register0.TCMP1))
	begin
		check = check +1;
		$display("Default count error, exp: %h, act: %h", dut.register0.TCMP0, dut.register0.TDR0);
	end
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

	write(12'h14, 32'h0, 4'b1111);
	@(posedge sys_clk);
	if(tim_int != 1'b0)
	begin
		check = check +1;
		$display("Interrupt mask error");
	end
	read(12'h18);
	if( read_data !=  32'h1)
	begin
		check = check +1;
		$display("Interrupt status keep error");
	end




end

//Count from a number

repeat(5)
begin
i = $urandom_range(32'hff, 32'h0000_ffff);
reset;
write(12'h4, i, 4'b1111);
write(12'h8, 32'h0, 4'b1111);

write(12'hC, i+255, 4'b1111);
write(12'h10,32'h0, 4'b1111);

int_enable;
tim_def_en;
repeat(255+1) @(posedge sys_clk);
if ((dut.register0.TDR0 != dut.register0.TCMP0) && (dut.register0.TDR1 != dut.register0.TCMP1))
	begin
		check = check +1;
		$display("Count from number error,TDR0 exp: %h, act: %h", dut.register0.TCMP0, dut.register0.TDR0);
	end
if(tim_int != 1'b1)
	begin
		check = check +1;
		$display("Count from number interrupt set error");
	end
read(12'h18);
if( read_data !=  32'h1)
	begin
		check = check +1;
		$display("Count from number interrupt status set error");
	end


end

// Count limit
reset;
write(12'h4, 32'hffff_ff00, 4'b1111);
write(12'h8, 32'hffff_ffff, 4'b1111);
tim_def_en;
repeat(300+1) @(posedge sys_clk);
if ((dut.register0.TDR0 != 44) || (dut.register0.TDR1 != 0))begin
	check = check +1;
	$display("Count limit error");
end

if ( check == 0)
	$display("COUNT PASS");
else 
	$display("COUNT FAIL");
$finish;
end
