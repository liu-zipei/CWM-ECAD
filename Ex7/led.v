//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module led(input clk,rst,button,output reg [2:0] color);
	initial begin
		color = 3'b001;
	end

	always @(posedge clk or posedge rst) begin
		if(rst|color==3'b111|color==3'b000)
				color = 3'b001;
		else if(button) begin
			if(color==3'b110) begin
				color = 3'b001;
			end
			else begin
				color = color+3'b001;				
			end
		end
	end			
endmodule

