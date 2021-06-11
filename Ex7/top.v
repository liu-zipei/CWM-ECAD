//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Zipei Liu
// Date: 11 June 2021
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

module selector(input clk,sel,rst,button, output [23:0] light);
	parameter [23:0] white = 24'hFFFFFF;
	wire enable;
	wire [2:0] color;
	wire [23:0] rgb, out, a, b;
	led myled(.clk(clk),.rst(rst),.button(button),.color(color));
	converter myconverter(.clk(clk),.enable(1'b1),.color(color),.rgb(rgb));
	multiplexer mymultiplexer(.a(white),.b(rgb),.sel(sel),.out(light));
endmodule
