/**
 * @module reg_32_bit
 * @brief 32-bit register module
 *
 * This module represents a 32-bit register with clock, clear, enable, input, and output signals.
 * It stores a 32-bit input value when the enable signal is active and outputs the stored value when requested.
 * The register can be cleared to 0 when the clear signal is active.
 *
 * @param clk Clock signal
 * @param clr Clear signal
 * @param en Write/enable signal
 * @param d 32-bit input to register (BusMuxOut)
 * @param q 32-bit output from register (BusMuxIn_R#)
 */
module reg_32_bit (
	input wire clk,
	input wire clr,
	input wire enable,
	input wire [31:0] d,
	output reg [31:0] q
);

	// Initialize output to 0
	initial q = 0;

	// Register behavior
	always @ (posedge clk) begin
		if (clr)
			q <= 0;
		else if (enable)
			q <= d;
	end

endmodule

/**
 * @module pc_reg
 * @brief Program Counter (PC) register module
 *
 * This module represents a program counter register with clock, enable, and increment signals.
 * It stores a 32-bit input value when the enable signal is active and increments the stored value when the increment signal is active.
 * The register can be used to keep track of the program counter in a CPU.
 *
 * @param clk Clock signal
 * @param en Write/enable signal
 * @param pc_increment Increment the program counter
 * @param pc_in 32-bit input to register (BusMuxOut)
 * @param pc_out 32-bit output from register (BusMuxIn_PC)
 */
module pc_reg (
	input wire clk,				// clock signal
	input wire en,				// write/enable signal
	input wire pc_increment,	// increment the pc
	input wire [31:0] pc_in,	// 32-bit input to register (BusMuxOut)
	output reg [31:0] pc_out	// 32-bit output from register (BusMuxIn_PC)
);

	// Initialize output to 0
	initial pc_out = 0;

	// Register behavior
	always @ (posedge clk) begin
		if (pc_increment)
			pc_out <= pc_out + 1;
		else if (en)
			pc_out = pc_in;
	end

endmodule