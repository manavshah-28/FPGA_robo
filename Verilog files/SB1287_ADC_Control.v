/* Module SM1118_ADC_Control

This Module controls the built-in 12-bit adc of the de0 Nano board.

This ADC Module is responsible to get analog input values from the
line follower sensor in the appropriate channels.

ADC Control design
Input  :  ac_sck : 3.125MHz Clock
          dout   : digital output from ADC128S022 (serial 12-bit),
Outpu  :  adc_cs_n : Chip Select, 
          din      : Ch. address input to ADC128S022, 
          d_out_ch1, d_out_ch3, d_out_ch4 : 12-bit output of ch. 1,3 & 4 */

module SB1287_ADC_Control(
    input  adc_sck, dout,
    output [11:0] d_out_ch1, d_out_ch3, d_out_ch4,
    output adc_cs_n, din
);

// Decalring variables
reg[11:0] dout_chx, dout_ch1 = 0, dout_ch3 = 0, dout_ch4 = 0;
reg[4:0] data_counter = 0;
reg[3:0] din_counter = 0, sp_counter = 0;
reg[2:0] channel_select = 0, channel = 0;
reg[2:0] mem1 [0:2];
reg adc_cs = 1, din_temp = 0;

// Initializing Channels for 1, 3, 4 to get input
//from the line follower sensor
initial begin
    mem1[0] = 1;
    mem1[1] = 3;
    mem1[2] = 4;
end

// Selecting data Channels Block
// Channels need to be selected 1, 3, 4
always @(negedge adc_sck) begin
    if (din_counter == 0) adc_cs = ~adc_cs;
    if (channel_select > 2) channel_select = 0;
    else if((din_counter >= 2) && (din_counter <= 4)) channel = mem1[channel_select];
    else if(din_counter == 15) begin
            adc_cs = ~adc_cs;
            channel_select = channel_select + 1;
        end
    case(din_counter)
        2: din_temp = channel[2]; 
        3: din_temp = channel[1];
        4: din_temp = channel[0];
        default: din_temp = 0;
    endcase
    din_counter = din_counter + 1;
end

// Serial Read Parallel Out Block
always @(posedge adc_sck) begin
    if(sp_counter >= 4 && sp_counter <=15) begin
        dout_chx = {dout_chx[10:0], dout};
    end
    sp_counter = sp_counter + 1;
end

// Data Visualization and d_out_chx mapping Block
always @(negedge adc_sck) begin
    if(data_counter == 16) begin
        data_counter = 0;
        case(channel)
            1: dout_ch1 = dout_chx;
            3: dout_ch3 = dout_chx;
            4: dout_ch4 = dout_chx;
        endcase
    end
    data_counter = data_counter + 1;
end

// Assigning Outputs with corresponding Registers
assign adc_cs_n = adc_cs;
assign din = din_temp;
assign d_out_ch1 = dout_ch3;
assign d_out_ch3 = dout_ch4;
assign d_out_ch4 = dout_ch1;

endmodule
