module bus_mux_32_to_1 (
    // 32 bit output from a selected register
    output reg [31:0] bus_mux_out,

    // 5 bit input from the encoder_32_to_5 to select the register to put on the bus
    input wire [4:0] select_encoded,
    
    // up to 32 wire inputs because 5 bit select signal (24 for now)
    input wire [31:0] bus_mux_in_r0,
    input wire [31:0] bus_mux_in_r1,
    input wire [31:0] bus_mux_in_r2,
    input wire [31:0] bus_mux_in_r3,
    input wire [31:0] bus_mux_in_r4,
    input wire [31:0] bus_mux_in_r5,
    input wire [31:0] bus_mux_in_r6,
    input wire [31:0] bus_mux_in_r7,
    input wire [31:0] bus_mux_in_r8,
    input wire [31:0] bus_mux_in_r9,
    input wire [31:0] bus_mux_in_r10,
    input wire [31:0] bus_mux_in_r11,
    input wire [31:0] bus_mux_in_r12,
    input wire [31:0] bus_mux_in_r13,
    input wire [31:0] bus_mux_in_r14,
    input wire [31:0] bus_mux_in_r15,
    input wire [31:0] bus_mux_in_hi,
    input wire [31:0] bus_mux_in_lo,
    input wire [31:0] bus_mux_in_zhi,
    input wire [31:0] bus_mux_in_zlo,
    input wire [31:0] bus_mux_in_pc,
    input wire [31:0] bus_mux_in_mdr,
    input wire [31:0] bus_mux_in_inport,
    input wire [31:0] bus_mux_in_c_sign_extended
);

always @ (*) begin
	case (select_encoded)
        // Select the register to put on the bus based on the 5 bit input from the 32 to 5 encoder
        5'd0    :   bus_mux_out <= bus_mux_in_r0[31:0];
        5'd1    :   bus_mux_out <= bus_mux_in_r1[31:0];
        5'd2    :   bus_mux_out <= bus_mux_in_r2[31:0];
        5'd3    :   bus_mux_out <= bus_mux_in_r3[31:0];
        5'd4    :   bus_mux_out <= bus_mux_in_r4[31:0];
        5'd5    :   bus_mux_out <= bus_mux_in_r5[31:0];
        5'd6    :   bus_mux_out <= bus_mux_in_r6[31:0];
        5'd7    :   bus_mux_out <= bus_mux_in_r7[31:0];
        5'd8    :   bus_mux_out <= bus_mux_in_r8[31:0];
        5'd9    :   bus_mux_out <= bus_mux_in_r9[31:0];
        5'd10   :   bus_mux_out <= bus_mux_in_r10[31:0];
        5'd11   :   bus_mux_out <= bus_mux_in_r11[31:0];
        5'd12   :   bus_mux_out <= bus_mux_in_r12[31:0];
        5'd13   :   bus_mux_out <= bus_mux_in_r13[31:0];
        5'd14   :   bus_mux_out <= bus_mux_in_r14[31:0];
        5'd15   :   bus_mux_out <= bus_mux_in_r15[31:0];
        5'd16   :   bus_mux_out <= bus_mux_in_hi[31:0];
        5'd17   :   bus_mux_out <= bus_mux_in_lo[31:0];
        5'd18   :   bus_mux_out <= bus_mux_in_zhi[31:0];
        5'd19   :   bus_mux_out <= bus_mux_in_zlo[31:0];
        5'd20   :   bus_mux_out <= bus_mux_in_pc[31:0];
        5'd21   :   bus_mux_out <= bus_mux_in_mdr[31:0];
        5'd22   :   bus_mux_out <= bus_mux_in_inport[31:0];
        5'd23   :   bus_mux_out <= bus_mux_in_c_sign_extended[31:0];
        default :   bus_mux_out <= 32'd0;   // if no valid select_signal, default to 0
    endcase
end

endmodule