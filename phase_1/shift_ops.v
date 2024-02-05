// Shift right
module shr(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

	assign result = a >> b;

endmodule


// Arithmetic shift right
module shra(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

	assign result = a >>> b;

endmodule

// Shift left
module sl(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

	assign result = a << b;

endmodule