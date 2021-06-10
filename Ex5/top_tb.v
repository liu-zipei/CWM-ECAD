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
	reg [1:0] state; //state0 idle state1 heating state2 cooling
	
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk =~ clk;
	end
	
	initial begin
	//assigning temp and state values, testing temp from 15 to 25 to 16 using two for loops
		err = 0;
		state = heating + cooling<<1;

		for(temperature=5'd15;temperature<5'd25;temperature=temperature+1) begin
			#10
			state = heating + cooling<<1;
			if((temperature<5'd20&state!=2'b01)|(temperature>=5'd20&temperature<5'd22&state!=2'b00)|(temperature>=5'd22&state!=2'b10)) begin
				$display("***TEST FAILED! state malfunction in ascending temp.***");
				err=1;
			end
		end

		for(temperature=5'd25;temperature>5'd15;temperature=temperature-1) begin
			#10
			state = heating + cooling<<1;
			if((temperature<=5'd18&state!=2'b01)|(temperature>5'd18&temperature<=5'd20&state!=2'b00)|(temperature>5'd20&state!=2'b10)) begin
				$display("***TEST FAILED! state malfunction in descending temp.***");
				err=1;
			end
		end
	end

	initial begin
		#150
		if(!err) begin
			$display("***TEST PASSED!***");
			$finish;
		end
	end

	aircon test_aircon(.clk(clk),.temperature(temperature),.heating(heating),.cooling(cooling));

endmodule
