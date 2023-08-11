//this module is used to plan the path, decide turns taken and follow black line

module SB1287_bot_navigation(
 
 input clk,
 input [11:0]left,right,centre,
 output reg[2:0]traverse
 
);
reg bot_on_node=0;
always @(posedge clk)begin
			 if(left<450 && centre>1200 && right<450)begin
			  traverse=1;
			 end
			 else if(left>1200 && right <450)begin
				traverse=2;
			 end
			 else if(left<450 && right>1200)begin
				traverse=3;
			 end
			 else if(left>3000 && centre>3000 && right>3000)begin
				traverse = 0;
			 end
		 end
endmodule