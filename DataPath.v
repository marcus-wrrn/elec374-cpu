module DataPath(
	input wire clock,
    input wire clear
);


// REGISTERS
register PC(clock, clear, PCin, BusMuxOut, BusMuxInPC); // Program Counter
register IR(clock, clear, IRin, BusMuxOut, BusMuxInIR); // Instruction Register
register HI(clock, clear, HIin, BusMuxOut, BusMuxInHI); // HI Register dedicated to keep the high-order word of a Multiplication product, or the Remainder of a Division operation
register LO(clock, clear, LOin, BusMuxOut, BusMuxInLO); //  LO Register dedicated to keep the low-order word of a Multiplication product, or the Quotient of a Division operation

// General-Purpose Registers
register R0(clock, clear, R0in, BusMuxOut, BusMuxInR0);
register R1(clock, clear, R1in, BusMuxOut, BusMuxInR1);
register R2(clock, clear, R2in, BusMuxOut, BusMuxInR2);
register R3(clock, clear, R3in, BusMuxOut, BusMuxInR3);
register R4(clock, clear, R4in, BusMuxOut, BusMuxInR4);
register R5(clock, clear, R5in, BusMuxOut, BusMuxInR5);
register R6(clock, clear, R6in, BusMuxOut, BusMuxInR6);
register R7(clock, clear, R7in, BusMuxOut, BusMuxInR7);

// Return Value Registers
register R8(clock, clear, R8in, BusMuxOut, BusMuxInR8);
register R9(clock, clear, R9in, BusMuxOut, BusMuxInR9);

// Argument Registers
register R10(clock, clear, R10in, BusMuxOut, BusMuxInR10);
register R11(clock, clear, R11in, BusMuxOut, BusMuxInR11);
register R12(clock, clear, R12in, BusMuxOut, BusMuxInR12);
register R13(clock, clear, R13in, BusMuxOut, BusMuxInR13);

// Stack Pointer Register (SP) register
register R14(clock, clear, R14in, BusMuxOut, BusMuxInR14);

// Return Address Register (RA)
register R15(clock, clear, R15in, BusMuxOut, BusMuxInR15);  

endmodule
