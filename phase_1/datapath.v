// TODO: Finish the datapath module

module datapath (
	input wire clk,
    input wire clr,
    input wire[31:0] select,
    output wire[4:0] select_encoded
);

// Bus wire
wire [31:0] bus;

// Register enable signals
wire r0_enable;
wire r1_enable;
wire r2_enable;
wire r3_enable;
wire r4_enable;
wire r5_enable;
wire r6_enable;
wire r7_enable;
wire r8_enable;
wire r9_enable;
wire r10_enable;
wire r11_enable;
wire r12_enable;
wire r13_enable;
wire r14_enable;
wire r15_enable;
wire y_enable;
wire hi_enable;
wire lo_enable;
wire zlo_enable;
wire zhi_enable;
wire pc_enable;
wire mdr_enable;
wire ir_enable;

// Register output data wires (connect to the bus)
wire[31:0] r0_out = 0;
wire[31:0] r1_out = 0;
wire[31:0] r2_out = 0;
wire[31:0] r3_out = 0;
wire[31:0] r4_out = 0;
wire[31:0] r5_out = 0;
wire[31:0] r6_out = 0;
wire[31:0] r7_out = 0;
wire[31:0] r8_out = 0;
wire[31:0] r9_out = 0;
wire[31:0] r10_out = 0;
wire[31:0] r11_out = 0;
wire[31:0] r12_out = 0;
wire[31:0] r13_out = 0;
wire[31:0] r14_out = 0;
wire[31:0] r15_out = 0;
wire[31:0] pc_out = 0;
wire[31:0] hi_out = 0;
wire[31:0] lo_out = 0;
wire[31:0] zhi_out = 0;
wire[31:0] mdr_out = 0;
wire[31:0] zlo_out = 0;
wire[31:0] inport_out = 0;
wire[31:0] c_sign_extended_out = 0;

// Instantiate register modules
reg_32_bit r0(clk, clr, r0_enable, bus, r0_out);
reg_32_bit r1(clk, clr, r1_enable, bus, r1_out);
reg_32_bit r2(clk, clr, r2_enable, bus, r2_out);
reg_32_bit r3(clk, clr, r3_enable, bus, r3_out);
reg_32_bit r4(clk, clr, r4_enable, bus, r4_out);
reg_32_bit r5(clk, clr, r5_enable, bus, r5_out);
reg_32_bit r6(clk, clr, r6_enable, bus, r6_out);
reg_32_bit r7(clk, clr, r7_enable, bus, r7_out);
reg_32_bit r8(clk, clr, r8_enable, bus, r8_out);
reg_32_bit r9(clk, clr, r9_enable, bus, r9_out);
reg_32_bit r10(clk, clr, r10_enable, bus, r10_out);
reg_32_bit r11(clk, clr, r11_enable, bus, r11_out);
reg_32_bit r12(clk, clr, r12_enable, bus, r12_out);
reg_32_bit r13(clk, clr, r13_enable, bus, r13_out);
reg_32_bit r14(clk, clr, r14_enable, bus, r14_out);
reg_32_bit r15(clk, clr, r15_enable, bus, r15_out);

reg_32_bit y(clk, clr, y_enable, bus, y_out);
reg_32_bit hi(clk, clr, hi_enable, bus, hi_out);
reg_32_bit lo(clk, clr, lo_enable, bus, lo_out);
reg_32_bit zlo(clk, clr, zlo_enable, bus, zlo_out);
reg_32_bit zhi(clk, clr, zhi_enable, bus, zhi_out);
reg_32_bit pc(clk, clr, pc_enable, bus, pc_out);
reg_32_bit mdr(clk, clr, mdr_enable, bus, mdr_out);
reg_32_bit ir(clk, clr, ir_enable, bus, ir_out);

// Instantiate Bus Mux
bus_mux_32_to_1 bus_mux(
    .bus_mux_out(bus),
    .select_encoded(select_encoded),
    .bus_mux_in_r0(r0_out),
    .bus_mux_in_r1(r1_out),
    .bus_mux_in_r2(r2_out),
    .bus_mux_in_r3(r3_out),
    .bus_mux_in_r4(r4_out),
    .bus_mux_in_r5(r5_out),
    .bus_mux_in_r6(r6_out),
    .bus_mux_in_r7(r7_out),
    .bus_mux_in_r8(r8_out),
    .bus_mux_in_r9(r9_out),
    .bus_mux_in_r10(r10_out),
    .bus_mux_in_r11(r11_out),
    .bus_mux_in_r12(r12_out),
    .bus_mux_in_r13(r13_out),
    .bus_mux_in_r14(r14_out),
    .bus_mux_in_r15(r15_out),
    .bus_mux_in_hi(hi_out),
    .bus_mux_in_lo(lo_out),
    .bus_mux_in_zhi(zhi_out),
    .bus_mux_in_zlo(zlo_out),
    .bus_mux_in_pc(pc_out),
    .bus_mux_in_mdr(mdr_out),
    // TODO: Verify the following connections
    .bus_mux_in_inport(inport_out),
    .bus_mux_in_c_sign_extended(c_sign_extended_out)
);

// Instantiate Select Signal Encoder and encoded select signal
// wire [4:0] select_encoded;
encoder_32_to_5 select_encoder(
    .encoder_in(select),
    .encoder_out(select_encoded)
);

// TODO: Instantiate ALU

endmodule
