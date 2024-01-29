module DataPath(
	input wire clock,
    input wire clear
);


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
register Z(clock, clear, Zin, bus_contents, Z_data_out); // Z Register dedicated to keep the low-order word of a Multiplication product, or the Quotient of a Division operation

// MEMORY STATE REGISTERS
register MDR(clock, clear, MDRin, bus_contents, MDR_data_out); // Memory Data Register
register MAR(clock, clear, MARin, bus_contents, MAR_data_out); // Memory Address Register

// I/O UNIT REGISTERS
register INPORT(clock, clear, INPORTin, INPORT_input, INPORT_data_out); // Input Port Register
register OUTPORT(clock, clear, OUTPORTin, bus_contents, OUTPORT_data_out); // Input Port Register

// TODO: Mem[0..511]<31..0>: 512 words (32 bits per word) of memory
// TODO: I/O State
// In.Port<31..0>: 32-bit Input Port
// Out.Port<31..0>: 32-bit Output Port
// Run.Out: Run/halt Indicator
// Stop.In: Stop signal
// Reset.In: Reset signal


endmodule
