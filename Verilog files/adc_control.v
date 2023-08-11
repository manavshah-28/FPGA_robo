//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module adc_control(
	input  clk_50,				//50 MHz clock
	input  dout,				//digital output from ADC128S022 (serial 12-bit)
	output adc_cs_n,	                //ADC128S022 Chip Select
	output din,		                //Ch. address input to ADC128S022 (serial)
	output adc_sck,			        // MHz ADC clock
	output [11:0]d_out_ch5,	                //12-bit output of ch. 5 (parallel)
	output [11:0]d_out_ch6,	                //12-bit output of ch. 6 (parallel)
	output [11:0]d_out_ch7,	                //12-bit output of ch. 7 (parallel)
	output [1:0]data_frame	                //To represent 16-cycle frame (optional)
);
	
////////////////////////WRITE YOUR CODE FROM HERE////////////////////

reg[11:0] channelX;   //variable x channel used for assign operations 
reg[11:0] ch5 = 0;    //initializing channels to zero first 
reg[11:0] ch6 = 0;
reg[11:0] ch7 = 0;
reg sclk_out = 0;
reg din_temp = 0;
reg[2:0] channel_sel = 5; //starting with channel 5
reg[2:0] channel = 0;
reg[1:0] visualize = 1;

//declaring various counters 
reg[4:0] dcount = 0;
reg[3:0] count = 0;
reg[3:0] din_count = 0;
reg[3:0] s_clk_count = 0;
  

//frequency required is from 0.8 to 3.2 Mhz 
// making the frequency near 3 Mhz 
	
always @(negedge clk_50) begin  
    if (s_clk_count == 10) begin
	    sclk_out=~sclk_out;
       s_clk_count = 0;              //reset it to start from 0 again
    end
    s_clk_count = s_clk_count + 1;
end

//the adc chip will select only 3 channels 
// they are given as channel 5 channel 6 and channel 7 

always @(negedge adc_sck) begin
	if (channel_sel > 7) 
		begin
			channel_sel = 5; //repeat between channel 5 then 6 then 7 then 5 again
		end
	else if((din_count <= 4) && (din_count >=2)) 
		begin
			channel = channel_sel; //at din 2 
		end
	else if(din_count == 15) 
		begin
			channel_sel = channel_sel + 1;
		end
    case(din_count)
        2: din_temp = channel[2]; 
        3: din_temp = channel[1];
        4: din_temp = channel[0];
        default: din_temp = 0;
    endcase
    din_count = din_count + 1;
end

// Serial Read Parallel Out Block
always @(posedge adc_sck) begin
    if(count >= 4 && count <=15) begin
        channelX = {channelX[10:0], dout};
    end
    count = count + 1;
end
always @(negedge adc_sck) begin

    if(dcount == 16) begin
        dcount = 0;
        visualize = visualize + 1;
        if(visualize == 0) visualize = 1;
        case(channel)
            5: ch5 = channelX;
            6: ch6 = channelX;
            7: ch7 = channelX;
        endcase
    end
    dcount = dcount + 1;
end
//make adc clock zero 
assign adc_cs_n = 0;  //selects the on board adc 

//making assignments and connecting assumed variables to actual outputs
assign d_out_ch5 = ch6;
assign d_out_ch6 = ch7;
assign d_out_ch7 = ch5;
assign din = din_temp;
assign adc_sck = sclk_out;
assign data_frame = visualize;
////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////