// SB : Task 1 B : Finite State Machine
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a Finite State Machine.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
			Do not make any changes to Test_Bench_Vector.txt file. Violating will result into Disqualification.
-------------------
*/

//Finite State Machine design
//Inputs  : I (4 bit) and CLK (clock)
//Output  : Y (Y = 1 when 102210 sequence(decimal number sequence) is detected)
//s0=
//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module fsm(
	input  CLK,			  //Clock
	input [3:0]I,       //INPUT I
	output  reg Y		  //OUTPUT Y
);
/*
reg Y1 = 0;
assign Y = Y1;*/
initial Y<=0;

localparam  S0=3'b000, //S0 State
				S1=3'b001, //S1 State
				S2=3'b011, //S2 State
				S3=3'b010, //S3 State
				S4=3'b111, //S4 State
				S5=3'b101, //S5 State
            S6=3'b100; //S6 State
reg[2:0] current_state,next_state;//sequential memory of moore FSM

always @(posedge CLK)
current_state<=next_state;

//combinaitional logic of FSM
always @(current_state,I[3:0])
begin
     case(current_state)
	  S0:begin
	     if(I[3:0]==4'b0001)
		     next_state<=S1;
		  else if(I[3:0]==4'b0000 | I[3:0]==4'b0010)
		     next_state<=S0;
		  end
	  S1:begin
	     if(I[3:0]==4'b0000)
		     next_state<=S2;
		  else if(I[3:0]==4'b0001)
		     next_state<=S1;
		  else if(I[3:0]==4'b0010)
		     next_state<=S0;
		  end
	  S2:begin
	     if(I[3:0]==4'b0010)
		     next_state<=S3;
		  else if(I[3:0]==4'b0001)
		     next_state<=S1;
		  else if(I[3:0]==4'b0000)
		     next_state<=S0;
		  end
	   S3:begin
		  if(I[3:0]==4'b0010)
		     next_state<=S4;
		  else if(I[3:0]==4'b0001)
		     next_state<=S1;
		  else if(I[3:0]==4'b0000)
		     next_state<=S0;
		  end
		S4:begin
		  if(I[3:0]==4'b0001)
		     next_state<=S5;
		  else if(I[3:0]==4'b0000 | I[3:0]==4'b0010)
		     next_state<=S0;
		  end
		S5:begin
		  if(I[3:0]==4'b0000)
		     next_state<=S6;
		  else if(I[3:0]==4'b0001)
		     next_state<=S1;
		  else if(I[3:0]==4'b0010)
		     next_state<=S0;
		   end
		S6:begin
		  if(I[3:0]==4'b0001)
		     next_state<=S1;
		  else if(I[3:0]==4'b0000)
		     next_state<=S0;
		  else if(I[3:0]==4'b0010)
		     next_state<=S3;
		  end
      default:next_state<=S0;
      endcase
      end
always@(current_state)
begin
     case(current_state)
	  S0:Y<=0;
	  S1:Y<=0;
	  S2:Y<=0;
	  S3:Y<=0;
	  S4:Y<=0;
	  S5:Y<=0;
	  S6:Y<=1;
	  default:Y<=0;
	  endcase
	  end
		  
		  
		  
	 
		  
				


////////////////////////WRITE YOUR CODE FROM HERE//////////////////// 
	

// Tip : Write your code such that Quartus Generates a State Machine 
//			(Tools > Netlist Viewers > State Machine Viewer).
// 		For doing so, you will have to properly declare State Variables of the
//       State Machine and also perform State Assignments correctly.
//			Use Verilog case statement to design.
	
	

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////