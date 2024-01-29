/**
 * @module register
 * @brief This module represents a register with synchronous reset and enable functionality.
 *
 * The register module has the following ports:
 * - clk: Clock input
 * - clr: Clear input, when high clears the register to 0
 * - enable: Enable input, when high updates the register with the input data
 * - d: Data input, 32-bit wide
 * - q: Data output, 32-bit wide
 *
 * The register module initializes the output q with the value of qInitial.
 * On each positive edge of the clock (clk), the register updates its value based on the clr and enable inputs.
 * If clr is high, the register is cleared to 0.
 * If enable is high, the register is updated with the value of d.
 */
module register #(parameter qInitial = 0)(
	input wire clk,
	input wire clr,
	input wire enable,
	input wire [31:0] d,
	output reg [31:0] q
);

	initial q = qInitial;
	always @ (posedge clk)
	begin 
		if (clr) begin
			q[31:0] <= 32'b0;
		end
		else if (enable) begin
			q[31:0] = d[31:0];
		end
	end
endmodule
