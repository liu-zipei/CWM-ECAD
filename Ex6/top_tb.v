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
	reg [23:0] mem[7:0] = {24'h000000, 24'h0000FF, 24'h00FF00, 24'h00FFFF, 24'hFF0000, 24'hFF00FF, 24'hFFFF00, 24'hFFFFFF};
	
	initial begin
		clk = 1'b1;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

	initial begin
		err=0;
		enable=0;
		color=3'b001;
		if(rgb) begin
			$display("***TEST FAILED! enable not working.***");
			err=1;
		end
		
		for(color=3'b000;color<=3'b111;color=color+3'b001) begin
			#10
			if(rgb!=mem[color]) begin
				$display("***TEST FAILED! converter not working.***");
				err=1;
			end
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
