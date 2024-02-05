module encoder_32_to_5 (
    input wire [31:0] encoder_in,    // 32 bit input to be encoded to 5 bits
    output reg [4:0] encoder_out     // 5 bit output signal to bus_mux_32_to_1
);

always @ (*) begin
    case(encoder_in)
        // Convert the 32 bit input to a 5 bit output select signal for the bus_mux_32_to_1
        0           :   encoder_out <= 5'd0;    // input wire 0, output 00000
        (1 << 0)    :   encoder_out <= 5'd1;    // input wire bit 0 = 1, output 00001
        (1 << 1)    :   encoder_out <= 5'd2;    // input wire bit 1 = 1, output 00010
        (1 << 2)    :   encoder_out <= 5'd3;    // input wire bit 2 = 1, output 00011
        (1 << 3)    :   encoder_out <= 5'd4;    // input wire bit 3 = 1, output 00100
        (1 << 4)    :   encoder_out <= 5'd5;    // input wire bit 4 = 1, output 00101
        (1 << 5)    :   encoder_out <= 5'd6;    // input wire bit 5 = 1, output 00110
        (1 << 6)    :   encoder_out <= 5'd7;    // input wire bit 6 = 1, output 00111
        (1 << 7)    :   encoder_out <= 5'd8;    // input wire bit 7 = 1, output 01000
        (1 << 8)    :   encoder_out <= 5'd9;    // input wire bit 8 = 1, output 01001
        (1 << 9)    :   encoder_out <= 5'd10;   // input wire bit 9 = 1, output 01010
        (1 << 10)   :   encoder_out <= 5'd11;   // input wire bit 10 = 1, output 01011
        (1 << 11)   :   encoder_out <= 5'd12;   // input wire bit 11 = 1, output 01100
        (1 << 12)   :   encoder_out <= 5'd13;   // input wire bit 12 = 1, output 01101
        (1 << 13)   :   encoder_out <= 5'd14;   // input wire bit 13 = 1, output 01110
        (1 << 14)   :   encoder_out <= 5'd15;   // input wire bit 14 = 1, output 01111
        (1 << 15)   :   encoder_out <= 5'd16;   // input wire bit 15 = 1, output 10000
        (1 << 16)   :   encoder_out <= 5'd17;   // input wire bit 16 = 1, output 10001
        (1 << 17)   :   encoder_out <= 5'd18;   // input wire bit 17 = 1, output 10010
        (1 << 18)   :   encoder_out <= 5'd19;   // input wire bit 18 = 1, output 10011
        (1 << 19)   :   encoder_out <= 5'd20;   // input wire bit 19 = 1, output 10100
        (1 << 20)   :   encoder_out <= 5'd21;   // input wire bit 20 = 1, output 10101
        (1 << 21)   :   encoder_out <= 5'd22;   // input wire bit 21 = 1, output 10110
        (1 << 22)   :   encoder_out <= 5'd23;   // input wire bit 22 = 1, output 10111
        (1 << 23)   :   encoder_out <= 5'd24;   // input wire bit 23 = 1, output 11000
        default     :   encoder_out <= 5'd31;   // input wire invalid, output 11111 (an invalid 5 bit value for the bus_mux_32_to_1)
    endcase    
end

endmodule