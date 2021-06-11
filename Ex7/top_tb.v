//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Zipei Liu
// Date: 11 June 2021
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module top_tb();
	parameter CLK_PERIOD = 10;

	reg err,clk,sel,rst,button;
	wire [23:0] light;
	reg [23:0] light_prev;
	reg [2:0] color,color_prev;

	initial begin
		clk = 1'b1;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end
	
	initial begin
		err=0;
		sel=0;
		rst=0;
		button=0;
		#10
		if(light!=24'hFFFFFF) begin
			err=1;
			$display("***TEST FAILED***");
		end
		sel=1;
		rst=1;
		#10
		if(light!=24'h0000FF) begin
			err=1;
			$display("***TEST FAILED***");
		end
		rst=0;
		button=1;
		light_prev=light;

		forever begin
			#10
			color[0]=0-light[7:0];
			color[1]=0-light[15:8];
			color[2]=0-light[23:16];
			color_prev[0]=0-light_prev[7:0];
			color_prev[1]=0-light_prev[15:8];
			color_prev[2]=0-light_prev[23:16];
			if(color==3'b001) begin
				if(color_prev==3'b110) begin
					err=1;
					$display("***TEST FAILED***");
				end
			end
			else begin
				if(color-color_prev!=3'b001) begin
					err=1;
					$display("***TEST FAILED***");
				end
			end
			light_prev=light;
		end
	end

	initial begin
		#200
		if(!err)
			$display("***TEST PASSED***");
		$finish;
	end
	selector test_selector(.clk(clk),.sel(sel),.rst(rst),.button(button),.light(light));
endmodule
