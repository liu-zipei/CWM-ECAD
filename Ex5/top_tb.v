//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Zipei Liu
// Date: 09 June 2021
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();
	parameter CLK_PERIOD = 10;
	
	reg clk,err;
	reg [4:0] temperature;
	wire heating, cooling;
	
	initial begin
		clk = 1'b1;
		forever
			#(CLK_PERIOD/2) clk =~ clk;
	end
	
	initial begin
	//assigning temp and state values, testing temp from 15 to 25 to 16 using two for loops
		err = 0;
		temperature = 5'd15;
		#10
		
		for(temperature=5'd16;temperature<5'd25;temperature=temperature+1) begin
			#10
			if((temperature<5'd20&(heating!=1|cooling!=0))|(temperature>=5'd20&temperature<5'd22&(heating!=0|cooling!=0))|(temperature>=5'd22&(heating!=0|cooling!=1))) begin
				$display("***TEST FAILED! state malfunction in ascending temp.***");
				err=1;
			end
		end

		for(temperature=5'd25;temperature>5'd15;temperature=temperature-1) begin
			#10
			if((temperature<=5'd18&(heating!=1|cooling!=0))|(temperature>5'd18&temperature<=5'd20&(heating!=0|cooling!=0))|(temperature>5'd20&(heating!=0|cooling!=1))) begin
				$display("***TEST FAILED! state malfunction in descending temp.***");
				err=1;
			end
		end
	end

	initial begin
		#200
		if(!err)
			$display("***TEST PASSED!***");
		$finish;
	end

	aircon test_aircon(.clk(clk),.temperature(temperature),.heating(heating),.cooling(cooling));

endmodule
