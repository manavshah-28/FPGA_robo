module SB1287_motor_control(
 input clk,
 input [2:0]motion,
 output reg [3:0]level_shift_input
);
//motor control logic 
/*
clockwise=(+)
anticlockwise=(-)
do nothing=(x)
                     motor movement 
 traverse|bot moves|    ML     MR   |4 bit value of level shift input
 0        stop     |    x      x    |    0000
 1			 forward  |    +      +    |    0000
 2			 left     |    x      +    |    0000
 3			 right    |    +      x    |    0000
 4			 uturn    |    +      -    |    0000    //taking turn from right hand side 
 5        left_turn|    -      +    |    0000
 6       right_turn|    +      -    |    0000
 */
 
//

always @(posedge clk)begin
case(motion)
                       //RRLL
 0: level_shift_input=4'b0000;
 1: level_shift_input=4'b0101; //forward
 2: level_shift_input=4'b0100; //left
 3: level_shift_input=4'b0001; //right
 4: level_shift_input=4'b1010; //reverse 
 5: level_shift_input=4'b0110; //left_turn
 6: level_shift_input=4'b1001; //right_turn
endcase
end
endmodule