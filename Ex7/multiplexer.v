//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name: Zipei Liu
// Date:08 June 2021 
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiplexer(
    //Todo: define inputs here
	input a,b,sel,
	output  out
    );
    
    //Todo: define registers and wires here
		

    //Todo: define your logic here                 
    assign  out = sel?b:a;  
endmodule
