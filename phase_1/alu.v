module alu (
	output reg [63:0] c, 		// 64-bit result
	input wire [4:0] op_code, 	// 5-bit opcode
	input wire [31:0] a,		// 32-bit operand A (from y)
	input wire [31:0] b,		// 32-bit operand B (from bus)
	input wire clk
);

// Intermediate wires for various operations
wire [31:0] and_result;
wire [31:0] or_result;

// Instantiation of modules for operations
logical_and and_op(.a(a), .b(b), .result(and_result));
logical_or or_op(.a(a), .b(b), .result(or_result));

// Opcodes for operations
localparam ld_opcode = 5'b00000;
localparam ldi_opcode = 5'b00001;
localparam st_opcode = 5'b00010;
localparam add_opcode = 5'b00011;
localparam sub_opcode = 5'b00100;
localparam shr_opcode = 5'b00101;
localparam shra_opcode = 5'b00110;
localparam shl_opcode = 5'b00111;
localparam ror_opcode = 5'b01000;
localparam rol_opcode = 5'b01001;
localparam and_opcode = 5'b01010;
localparam or_opcode = 5'b01011;
localparam addi_opcode = 5'b01100;
localparam andi_opcode = 5'b01101;
localparam ori_opcode = 5'b01110;
localparam mul_opcode = 5'b01111;
localparam div_opcode = 5'b10000;
localparam neg_opcode = 5'b10001;
localparam not_opcode = 5'b10010;


// Select the internal result based on the opcode
always @(*) begin
	case (op_code) 
		// FIXME: This is temporary for phase 1. This is to pass b to c when no op is selected
		ld_opcode: begin
			c[31:0] = b;
			c[63:32] = 32'b0;
		end

		and_opcode: begin
			c[31:0] = and_result;
			c[63:32] = 32'b0;
		end

		or_opcode: begin
			c[31:0] = or_result;
			c[63:32] = 32'b0;
		end

	endcase
end

endmodule
