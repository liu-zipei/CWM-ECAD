//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Zipei Liu
// Date: 10 June 2021
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module top_tb();
	parameter CLK_PERIOD = 10;

	reg clk, enable, err;
	reg [2:0] color;
	wire [23:0] rgb;

	initial begin
		clk = 1'b1;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

	initial begin
		err=0;
		enable=0;
		color=3'b011;
		#20
		if(rgb) begin
			$display("***TEST FAILED! enable not working.***");
			err=1;
		end

		enable=1;
		forever begin	
			#20
			if((0-rgb[7:0])!=color[0]|(0-rgb[15:8])!=color[1]|(0-rgb[23:16])!=color[2]) begin
				$display("***TEST FAILED! converter not working.***");
				err=1;
			end
			color = color+1;
		end
	end

	initial begin
		#200
		if(!err) begin
			$display("***TEST PASSED!***");
			$finish;
		end
	end	 
	converter test_converter(.clk(clk),.enable(enable),.color(color),.rgb(rgb));
endmodule
