//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:Zipei Liu
// Date: 09 June 2021
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module aircon(input clk, input [4:0] temperature, output reg heating,cooling);
	reg [1:0] state;
	parameter S0 = 0,S1 = 1,S2 = 2;

	always @(state) begin
		case (state)
			S0: 
			begin
				heating = 1;
				cooling = 0;
			end
			S1:
			begin
				heating = 0;
				cooling = 1;
			end
			S2:
			begin
				heating = 0;
				cooling = 0;
			end
			default: 
			begin
				heating = 0;
				cooling = 0;
			end
		endcase
	end
	
	always @(posedge clk) begin
		case(state)
			S0:
			begin
				if(temperature>=5'd20) begin
					state <= S2;
				end
				else begin
					state <= S0;
				end
			end
			S1:
			begin
				if(temperature<=5'd20) begin
					state <= S2;
				end
				else begin
					state <= S1;
				end
			end
			S2:
			begin
				if(temperature<=5'd18) begin
					state <= S0;
				end
				else begin 
					if(temperature>=5'd22) begin
						state <= S1;
					end
					else begin
						state <= S2;
					end
				end
			end
		endcase
	end
endmodule
