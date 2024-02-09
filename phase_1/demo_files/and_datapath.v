// and_datapath.v

module and_datapath (
    input pc_out, 
    input zlo_out, 
    input mdr_out,
    input r2_out,
    input r3_out,
    input mar_in,
    input zlo_enable,
    input pc_enable,
    input mdr_enable,
    input ir_enable,
    input y_enable,
    input pc_increment,
    input read,
    input and_signal,
    input r1_enable,
    input r2_enable,
    input r3_enable,
    input clk,
    input [31:0] m_data_in
);

wire [31:0] bus;
wire [31:0] mdr_connection;

// Register enable signals
wire r0_enable;
// wire r1_enable;
// wire r2_enable;
// wire r3_enable;
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
// wire y_enable;
wire hi_enable;
wire lo_enable;
// wire zlo_enable;
wire zhi_enable;
// wire pc_enable;
// wire mdr_enable;
// wire ir_enable;

// Register output data wires (connect to the bus)
wire[31:0] r0_out = 0;
wire[31:0] r1_out = 0;
// wire[31:0] r2_out = 0;
// wire[31:0] r3_out = 0;
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
// wire[31:0] pc_out = 0;
wire[31:0] hi_out = 0;
wire[31:0] lo_out = 0;
wire[31:0] zhi_out = 0;
// wire[31:0] mdr_out = 0;
// wire[31:0] zlo_out = 0;
wire[31:0] inport_out = 0;
wire[31:0] c_sign_extended_out = 0;

// Instantiate register modules

reg_32_bit r1(clk, clr, r1_enable, bus, r1_out);
reg_32_bit r2(clk, clr, r2_enable, bus, r2_out);
reg_32_bit r3(clk, clr, r3_enable, bus, r3_out);

reg_32_bit y(clk, clr, y_enable, bus, y_out);
reg_32_bit hi(clk, clr, hi_enable, bus, hi_out);
reg_32_bit lo(clk, clr, lo_enable, bus, lo_out);
reg_32_bit zlo(clk, clr, zlo_enable, bus, zlo_out);
reg_32_bit zhi(clk, clr, zhi_enable, bus, zhi_out);
reg_32_bit pc(clk, clr, pc_enable, bus, pc_out);
reg_32_bit ir(clk, clr, ir_enable, bus, ir_out);
reg_32_bit mdr(clk, clr, mdr_enable, mdr_connection, bus);


// Instantiate MDR Mux
mdr_mux_2_to_1 mdr_mux(
    .out(mdr_connection),
    .read(read),
    .from_bus(bus),
    .from_mem_chip(m_data_in)
);

// TODO: Instantiate ALU

endmodule
