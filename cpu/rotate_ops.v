// Rotate left
module rol(input wire[31:0] a, input wire[4:0] b, output reg[31:0] result);

	always @(*) begin
		result = a << b;
		result = result | (a >> (32 - b));
	end

endmodule

// Rotate right
module ror(input wire[31:0] a, input wire[4:0] b, output reg[31:0] result);

	always @(*) begin
		result = a >> b;
		result = result | (a << (32 - b));
	end

endmodule