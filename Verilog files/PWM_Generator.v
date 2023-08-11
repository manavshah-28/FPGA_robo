// SB : Task 1 D PWM Generator
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a module which will scale down the 50Mhz Clock Frequency to 1Mhz and perform Pulse Width Modulation on it.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//PWM Generator
//Inputs : Clk, DUTY_CYCLE
//Output : PWM_OUT

//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
`timescale 1ns/1ps
module PWM_Generator(
 
	input clk,             // Clock input
	input [7:0]DUTY_CYCLE, // Input Duty Cycle
	output PWM_OUT         // Output PWM
);
 
////////////////////////WRITE YOUR CODE FROM HERE////////////////////

reg [7:0] count =0;
reg puls=0;
always #15 puls=~puls;



always @(posedge puls)
begin
        if(count<=100)
		  begin
		  count=count+1;
		  end
		  else
		  begin
		  count=0;
		  end
end
	  
	  
assign PWM_OUT = (count<DUTY_CYCLE)? 1:0;

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////