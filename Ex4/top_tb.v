//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module top_tb();
	parameter CLK_PERIOD = 10;

	reg clk,rst,button,err;
	wire [2:0] color;
	reg [2:0] color_prev;

	initial	begin
		clk = 1'b1;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end
	
	initial begin
		err = 0;
		//Test on rst=1 and button=0
		rst = 1;
		button = 1;
		color_prev = 3'b001;
		#10
		if(color!={001}) begin
			$display("***TEST FAILED! reset not working***");
			err = 1;
		end
		rst = 0;
		button = 0;
		color_prev = color;
		#10
		if(color_prev!=color&&!(color=={000}|color=={111})) begin
			$display("***TEST FAILED! button not working***");
			err = 1;
		end
		button = 1;
		//loop on button=1
		forever begin
			#10

			if(color==3'b000|color==3'b111) begin
					$display("***TEST FAILED! not skipping 000&111***");
					err = 1;
			end
			if((color-color_prev)!=1&(!(color==3'b001&color_prev==3'b110))) begin
					$display("***TEST FAILED! color does not plus one each time***");
					err = 1;
			end
			color_prev = color;
		end
	end
	initial begin
		#500
		if(!err)
			$display("***TEST PASSED!***");
		$finish;
	end

	led testled(clk,rst,button,color);

endmodule
