module SB1287_freq_scale(
 input clk_50M,
 output adc_clk_out,cs_clk_out
);

// Declaring Variables
reg [14:0] cs_counter = 1;
reg [3:0] s_clk_counter = 1;
reg cs_out = 1, adc_out = 0;

// For Color Sensor
// 50 Mhz to 800 Khz
always @(posedge clk_50M) begin
    if (cs_counter == 3125) begin
        cs_out = ~cs_out; cs_counter = 0;
    end
    else cs_counter = cs_counter + 1;
end

// For ADC Module
// 50Mhz to 3.125Mhz
always @(negedge clk_50M) begin  
    if (s_clk_counter == 8) begin
        adc_out = ~adc_out; s_clk_counter = 0;
    end
    s_clk_counter = s_clk_counter + 1;
end

// Assigning Output Clock
assign cs_clk_out = cs_out;
assign adc_clk_out = adc_out;

endmodule