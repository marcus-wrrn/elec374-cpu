module DataPath(
	input wire clock,
    input wire clear
);

// Input wires to the bus's 32-to-1 multiplexer
wire [31:0] R0_data_out;
wire [31:0] R1_data_out;
wire [31:0] R2_data_out;
wire [31:0] R3_data_out;
wire [31:0] R4_data_out;
wire [31:0] R5_data_out;
wire [31:0] R6_data_out;
wire [31:0] R7_data_out;
wire [31:0] R8_data_out;
wire [31:0] R9_data_out;
wire [31:0] R10_data_out;
wire [31:0] R11_data_out;
wire [31:0] R12_data_out;
wire [31:0] R13_data_out;
wire [31:0] R14_data_out;
wire [31:0] R15_data_out;
wire [31:0] HI_data_out;
wire [31:0] LO_data_out;
wire [31:0] Z_HI_data_out;
wire [31:0] Z_LO_data_out;
wire [31:0] PC_data_out;
wire [31:0] MDR_data_out;
wire [31:0] INPORT_data_out;
wire [31:0] C_sign_extended;

// TODO: Input wires to the bus's 32-to-5 multiplexer (for enable signals)

// PROCESSOR STATE REGISTERS
register PC(clock, clear, PCin, bus_contents, PC_data_out); // Program Counter
register IR(clock, clear, IRin, bus_contents, IR_data_out); // Instruction Register
register HI(clock, clear, HIin, bus_contents, HI_data_out); // HI Register dedicated to keep the high-order word of a Multiplication product, or the Remainder of a Division operation
register LO(clock, clear, LOin, bus_contents, LO_data_out); // LO Register dedicated to keep the low-order word of a Multiplication product, or the Quotient of a Division operation

// General-Purpose Register
register R0(clock, clear, R0in, bus_contents, R0_data_out);
register R1(clock, clear, R1in, bus_contents, R1_data_out);
register R2(clock, clear, R2in, bus_contents, R2_data_out);
register R3(clock, clear, R3in, bus_contents, R3_data_out);
register R4(clock, clear, R4in, bus_contents, R4_data_out);
register R5(clock, clear, R5in, bus_contents, R5_data_out);
register R6(clock, clear, R6in, bus_contents, R6_data_out);
register R7(clock, clear, R7in, bus_contents, R7_data_out);

// Return Value Registers
register R8(clock, clear, R8in, bus_contents, R8_data_out);
register R9(clock, clear, R9in, bus_contents, R9_data_out);

// Argument Registers
register R10(clock, clear, R10in, bus_contents, R10_data_out);
register R11(clock, clear, R11in, bus_contents, R11_data_out);
register R12(clock, clear, R12in, bus_contents, R12_data_out);
register R13(clock, clear, R13in, bus_contents, R13_data_out);

// Stack Pointer Register (SP) register
register R14(clock, clear, R14in, bus_contents, R14_data_out);

// Return Address Register (RA)
register R15(clock, clear, R15in, bus_contents, R15_data_out);  

// ALU REGISTERS
register Y(clock, clear, Yin, bus_contents, Y_data_out); // Y Register dedicated to keep the high-order word of a Multiplication product, or the Remainder of a Division operation
register Z_HI(clock, clear, Z_HIin, bus_contents, Z_HI_data_out); // Z Register dedicated to keep the low-order word of a Multiplication product, or the Quotient of a Division operation
register Z_LO(clock, clear, Z_LOin, bus_contents, Z_LO_data_out); // Z Register dedicated to keep the low-order word of a Multiplication product, or the Quotient of a Division operation

// MEMORY STATE REGISTERS
register MDR(clock, clear, MDRin, bus_contents, MDR_data_out); // Memory Data Register
register MAR(clock, clear, MARin, bus_contents, MAR_data_out); // Memory Address Register

// I/O UNIT REGISTERS
register INPORT(clock, clear, INPORTin, INPORT_input, INPORT_data_out); // Input Port Register
register OUTPORT(clock, clear, OUTPORTin, bus_contents, OUTPORT_data_out); // Input Port Register

// TODO: Mem[0..511]<31..0>: 512 words (32 bits per word) of memory
// TODO: I/O States
// Run.Out: Run/halt Indicator
// Stop.In: Stop signal
// Reset.In: Reset signal

// TODO: Adder

// TODO: BUS


endmodule
