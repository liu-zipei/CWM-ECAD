//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();
	parameter CLK_PERIOD = 10;
	
	reg clk,err;
	
	wire temperature_4,
	wire temperature_3,
	wire temperature_2,
	wire temperature_1,
	wire temperature_0,
	reg [4:0] temperature;
	// = {temperature_4, temperature_3, temperature_2, temperature_1, temperature_0};
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
		assign temperature_4 = temperature[4];
		assign temperature_3 = temperature[3];
		assign temperature_2 = temperature[2];
		assign temperature_1 = temperature[1];
		assign temperature_0 = temperature[0];
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

	top test_aircon(.clk(clk),.temperature(temperature),.heating(heating),.cooling(cooling));

endmodule
