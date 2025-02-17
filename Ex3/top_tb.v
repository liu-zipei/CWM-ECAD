//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Zipei Liu
// Date: 08 June 2021
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk, rst, change, on_off, err;
	wire [7:0] counter_out;
	reg [7:0] counter_prev;
	reg [2:0] state;
//Todo: Clock generation
	initial	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end
    
//Todo: User logic
	initial begin
		state = 3'b100;
		err = 0;
		counter_prev = 0;
	//5 consecutive add and 3 subtract	
		rst = 0;
		change = 1;
		on_off = 1;
		#50
		on_off = 0;
		#30
	//initializing forever loop parameters
		rst = state[2];
		change = state[1];
		on_off = state[0];

		forever begin
			#10
		/*	if(rst&&(counter_out!=0)) begin
				$display("***TEST FAILED! did not reset.***");
				err = 1;
			end
			else begin
				if(!counter_prev) begin
					if(change^(counter_out!=counter_prev)) begin
						$display("***TEST FAILED!change does not have correct effect on counter value.***");
						err = 1;
					end
					if(change&(on_off^(counter_out>counter_prev))) begin
						$display("***TEST FAILED! counter not adding or subtracting correctly.***");
						err = 1;
					end
				end
				else begin
					if(change&on_off&counter_out!=1) begin
						$display("***TEST FAILED!parameters does not have correct effect on counter value.***");
					end
					if(change&!on_off&counter_out!=0) begin
						$display("***TEST FAILED!parameters does not have correct effect on counter value.***");
					end
				end
			end	*/
		//commented block is replaced by code below
				
			if(rst) begin
				if(counter_out) begin
					$display("***TEST FAILED***");
					err=1;
				end
			end
			else begin
				if(change) begin
					if(on_off) begin
						if(counter_out-counter_prev!=1) begin
							$display("***TEST FAILED***");
							err=1;
						end
					end
					else begin
						if(counter_prev) begin
							if(counter_prev-counter_out!=1) begin
								$display("***TEST FAILED***");
								err=1;
							end
						end
						else begin
							if(counter_out!=0) begin
								$display("***TEST FAILED***");	
								err=1;
							end
						end
					end
				end
				else begin
					if(counter_out!=counter_prev) begin
						$display("***TEST FAILED***");
						err=1;
					end
				end	
			end
			counter_prev = counter_out;
			state = state+1;
			rst = state[2];
			change = state[1];
			on_off = state[0];
		end
	end		

//Todo: Finish test, check for success
	initial begin
		#500
		if(!err)
			$display("***TEST PASSED!***");
		$finish;
	end
//Todo: Instantiate counter module
 	monitor test(.rst(rst),.change(change),.on_off(on_off),.clk(clk),.counter_out(counter_out));
endmodule
