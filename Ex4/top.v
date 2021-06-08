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
	always @(posedge clk or posedge rst) begin
		if(rst|color=={111}|color=={000})
				color = {001};
		if(button)
				color = color+1;
			
endmodule

