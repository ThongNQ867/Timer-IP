initial
begin
	reset;
	check = 0;

//TCR
	write(12'h0, 32'h0, 4'b1111);
	read(12'h0);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hFFFF_FFFF, 4'b1111);
	read(12'h0);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'h5555_5555, 4'b1111);
	read(12'h0);
	if (read_data != 32'h501)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hAAAA_AAAA, 4'b1111);
	read(12'h0);
	if (read_data != 32'h501)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'h0, 32'h0, 4'b1);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hFFFF_FFFF, 4'b1);
	read(12'h0);
	if (read_data != 32'h103)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'h5555_5555, 4'b1);
	read(12'h0);
	if (read_data != 32'h103)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hAAAA_AAAA, 4'b1);
	read(12'h0);
	if (read_data != 32'h102)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h0, 32'h0, 4'b10);
	read(12'h0);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hFFFF_FFFF, 4'b10);
	read(12'h0);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'h5555_5555, 4'b10);
	read(12'h0);
	if (read_data != 32'h500)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hAAAA_AAAA, 4'b10);
	read(12'h0);
	if (read_data != 32'h500)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h0, 32'h0, 4'b100);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hFFFF_FFFF, 4'b100);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'h5555_5555, 4'b100);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hAAAA_AAAA, 4'b100);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	
	reset;
	write(12'h0, 32'h0, 4'b1000);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hFFFF_FFFF, 4'd8);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'h5555_5555, 4'd8);
	read(12'h0);
	if (read_data !==  32'h100)
	begin
	//	$display("read_data: %h", read_data);
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h0, 32'hAAAA_AAAA, 4'd8);
	read(12'h0);
	if (read_data != 32'h100)
	begin
		check = check +1;
		$display("TCR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


// TDR0
	reset;
	write(12'h4, 32'h0, 4'b1111);
	read(12'h4);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hFFFF_FFFF, 4'b1111);
	read(12'h4);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'h5555_5555, 4'b1111);
	read(12'h4);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hAAAA_AAAA, 4'b1111);
	read(12'h4);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;
	

	write(12'h4, 32'h0, 4'b1);
	read(12'h4);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hFFFF_FFFF, 4'b1);
	read(12'h4);
	if (read_data != 32'hFF)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'h5555_5555, 4'b1);
	read(12'h4);
	if (read_data != 32'h55)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hAAAA_AAAA, 4'b1);
	read(12'h4);
	if (read_data != 32'hAA)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h4, 32'h0, 4'b10);
	read(12'h4);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hFFFF_FFFF, 4'b10);
	read(12'h4);
	if (read_data != 32'hFF00)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'h5555_5555, 4'b10);
	read(12'h4);
	if (read_data != 32'h5500)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hAAAA_AAAA, 4'b10);
	read(12'h4);
	if (read_data != 32'hAA00)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h4, 32'h0, 4'b100);
	read(12'h4);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hFFFF_FFFF, 4'b100);
	read(12'h4);
	if (read_data != 32'hFF_0000)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'h5555_5555, 4'b100);
	read(12'h4);
	if (read_data != 32'h55_0000)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hAAAA_AAAA, 4'b100);
	read(12'h4);
	if (read_data != 32'hAA_0000)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	
	reset;
	write(12'h4, 32'h0, 4'b1000);
	read(12'h4);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hFFFF_FFFF, 4'd8);
	read(12'h4);
	if (read_data != 32'hFF00_0000)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'h5555_5555, 4'd8);
	read(12'h4);
	if (read_data !==  32'h5500_0000)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h4, 32'hAAAA_AAAA, 4'd8);
	read(12'h4);
	if (read_data != 32'hAA00_0000)
	begin
		check = check +1;
		$display("TDR0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end	
//TDR1
	reset;
	write(12'h8, 32'h0, 4'b1111);
	read(12'h8);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'hFFFF_FFFF, 4'b1111);
	read(12'h8);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'h5555_5555, 4'b1111);
	read(12'h8);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'hAAAA_AAAA, 4'b1111);
	read(12'h8);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'h8, 32'h0, 4'b1);
	read(12'h8);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'hFFFF_FFFF, 4'b1);
	read(12'h8);
	if (read_data != 32'hFF)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'h5555_5555, 4'b1);
	read(12'h8);
	if (read_data != 32'h55)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'hAAAA_AAAA, 4'b1);
	read(12'h8);
	if (read_data != 32'hAA)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h8, 32'h0, 4'b10);
	read(12'h8);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'hFFFF_FFFF, 4'b10);
	read(12'h8);
	if (read_data != 32'hFF00)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'h5555_5555, 4'b10);
	read(12'h8);
	if (read_data != 32'h5500)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h8, 32'hAAAA_AAAA, 4'b10);
	read(12'h8);
	if (read_data != 32'hAA00)
	begin
		check = check +1;
		$display("TDR1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

//TCMP0
	reset;
	write(12'hC, 32'h0, 4'b1111);
	read(12'hC);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hFFFF_FFFF, 4'b1111);
	read(12'hC);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'h5555_5555, 4'b1111);
	read(12'hC);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hAAAA_AAAA, 4'b1111);
	read(12'hC);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'hC, 32'h0, 4'b1);
	read(12'hC);
	if (read_data !=32'hFFFF_FF00)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hFFFF_FFFF, 4'b1);
	read(12'hC);
	if (read_data != 32'hFFFF_FFFF)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'h5555_5555, 4'b1);
	read(12'hC);
	if (read_data != 32'hFFFF_FF55)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hAAAA_AAAA, 4'b1);
	read(12'hC);
	if (read_data != 32'hFFFF_FFAA)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'hC, 32'h0, 4'b10);
	read(12'hC);
	if (read_data != 32'hFFFF_00FF)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hFFFF_FFFF, 4'b10);
	read(12'hC);
	if (read_data != 32'hFFFF_FFFF)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'h5555_5555, 4'b10);
	read(12'hC);
	if (read_data != 32'hffff_55ff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hAAAA_AAAA, 4'b10);
	read(12'hC);
	if (read_data != 32'hffff_aaff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'hC, 32'h0, 4'b100);
	read(12'hC);
	if (read_data != 32'hff00_ffff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hFFFF_FFFF, 4'b100);
	read(12'hC);
	if (read_data != 32'hFFFF_FFFF)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'h5555_5555, 4'b100);
	read(12'hC);
	if (read_data != 32'hff55_ffff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hAAAA_AAAA, 4'b100);
	read(12'hC);
	if (read_data != 32'hffaa_ffff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'hC, 32'h0, 4'b1000);
	read(12'hC);
	if (read_data != 32'h00ff_ffff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hFFFF_FFFF, 4'b1000);
	read(12'hC);
	if (read_data != 32'hFFFF_FFFF)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'h5555_5555, 4'b1000);
	read(12'hC);
	if (read_data != 32'h55ff_ffff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'hC, 32'hAAAA_AAAA, 4'b1000);
	read(12'hC);
	if (read_data != 32'haaff_ffff)
	begin
		check = check +1;
		$display("TCMP0 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end



//TCMP1
	reset;
	write(12'h10, 32'h0, 4'b1111);
	read(12'h10);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hFFFF_FFFF, 4'b1111);
	read(12'h10);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'h5555_5555, 4'b1111);
	read(12'h10);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hAAAA_AAAA, 4'b1111);
	read(12'h10);
	if (read_data != tim_pwdata)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'h10, 32'h0, 4'b1);
	read(12'h10);
	if (read_data != 32'hffff_ff00)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hFFFF_FFFF, 4'b1);
	read(12'h10);
	if (read_data != 32'hffff_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'h5555_5555, 4'b1);
	read(12'h10);
	if (read_data != 32'hffff_ff55)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hAAAA_AAAA, 4'b1);
	read(12'h10);
	if (read_data != 32'hffff_ffaa)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h10, 32'h0, 4'b10);
	read(12'h10);
	if (read_data != 32'hffff_00ff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hFFFF_FFFF, 4'b10);
	read(12'h10);
	if (read_data != 32'hffff_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'h5555_5555, 4'b10);
	read(12'h10);
	if (read_data != 32'hffff_55ff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hAAAA_AAAA, 4'b10);
	read(12'h10);
	if (read_data != 32'hffff_aaff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h10, 32'h0, 4'b100);
	read(12'h10);
	if (read_data != 32'hff00_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hFFFF_FFFF, 4'b100);
	read(12'h10);
	if (read_data != 32'hFFFF_FFFF)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'h5555_5555, 4'b100);
	read(12'h10);
	if (read_data != 32'hff55_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hAAAA_AAAA, 4'b100);
	read(12'h10);
	if (read_data != 32'hffaa_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h10, 32'h0, 4'b1000);
	read(12'h10);
	if (read_data != 32'h00ff_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hFFFF_FFFF, 4'b1000);
	read(12'h10);
	if (read_data != 32'hFFFF_FFFF)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'h5555_5555, 4'b1000);
	read(12'h10);
	if (read_data != 32'h55ff_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h10, 32'hAAAA_AAAA, 4'b1000);
	read(12'h10);
	if (read_data != 32'haaff_ffff)
	begin
		check = check +1;
		$display("TCMP1 rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

//TIER

	reset;
	write(12'h14, 32'h0, 4'b1111);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hFFFF_FFFF, 4'b1111);
	read(12'h14);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'h5555_5555, 4'b1111);
	read(12'h14);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hAAAA_AAAA, 4'b1111);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'h14, 32'h0, 4'b1);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hFFFF_FFFF, 4'b1);
	read(12'h14);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'h5555_5555, 4'b1);
	read(12'h14);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hAAAA_AAAA, 4'b1);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;
	write(12'h14, 32'h0, 4'b10);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hFFFF_FFFF, 4'b10);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'h5555_5555, 4'b10);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hAAAA_AAAA, 4'b10);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;

	write(12'h14, 32'h0, 4'b100);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hFFFF_FFFF, 4'b100);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'h5555_5555, 4'b100);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hAAAA_AAAA, 4'b100);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;

	write(12'h14, 32'h0, 4'b1000);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hFFFF_FFFF, 4'b1000);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'h5555_5555, 4'b1000);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h14, 32'hAAAA_AAAA, 4'b1000);
	read(12'h14);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TIER rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

//TISR
	
	reset;
	write(12'h18, 32'h0, 4'b1111);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hFFFF_FFFF, 4'b1111);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'h5555_5555, 4'b1111);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hAAAA_AAAA, 4'b1111);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end


	reset;
	write(12'h18, 32'h0, 4'b1);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hFFFF_FFFF, 4'b1);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'h5555_5555, 4'b1);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hAAAA_AAAA, 4'b1);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h18, 32'h0, 4'b10);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hFFFF_FFFF, 4'b10);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'h5555_5555, 4'b10);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hAAAA_AAAA, 4'b10);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h18, 32'h0, 4'b100);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hFFFF_FFFF, 4'b100);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'h5555_5555, 4'b100);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hAAAA_AAAA, 4'b100);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h18, 32'h0, 4'b1000);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hFFFF_FFFF, 4'b1000);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'h5555_5555, 4'b1000);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h18, 32'hAAAA_AAAA, 4'b1000);
	read(12'h18);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("TISR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end
//THCSR
	reset;
	write(12'h1C, 32'h0, 4'b1111);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hFFFF_FFFF, 4'b1111);
	read(12'h1C);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'h5555_5555, 4'b1111);
	read(12'h1C);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hAAAA_AAAA, 4'b1111);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h1C, 32'h0, 4'b1);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hFFFF_FFFF, 4'b1);
	read(12'h1C);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'h5555_5555, 4'b1);
	read(12'h1C);
	if (read_data != 32'h1)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hAAAA_AAAA, 4'b1);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h1C, 32'h0, 4'b10);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hFFFF_FFFF, 4'b10);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'h5555_5555, 4'b10);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hAAAA_AAAA, 4'b10);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h1C, 32'h0, 4'b100);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hFFFF_FFFF, 4'b100);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'h5555_5555, 4'b100);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hAAAA_AAAA, 4'b100);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	reset;
	write(12'h1C, 32'h0, 4'b1000);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hFFFF_FFFF, 4'b1000);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'h5555_5555, 4'b1000);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

	write(12'h1C, 32'hAAAA_AAAA, 4'b1000);
	read(12'h1C);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("THCSR rw error, write: %h, read: %h, strobe %b",tim_pwdata,read_data, tim_pstrb);
	end

//Reserved access

	write(12'h20, 32'hFFFF_FFFF,4'b1111);
	read(12'h20);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("Reserved register rw error, exp read 32'h0, act %h",read_data);
	end

	write(12'h80E, 32'hFFFF_FFFF,4'b1111);
	read(12'h20);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("Reserved register rw error, exp read 32'h0, act %h",read_data);
	end
	write(12'hFFC, 32'hFFFF_FFFF,4'b1111);
	read(12'h20);
	if (read_data != 32'h0)
	begin
		check = check +1;
		$display("Reserved register rw error, exp read 32'h0, act %h",read_data);
	end

	if (check == 0)
		$display("RW PASS");
	else
		$display("RW FAIL");

	$finish;
end

