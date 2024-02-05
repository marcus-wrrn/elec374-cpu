module alu(
	input [3:0] select,
	input signed [31:0] A,
	input signed [31:0] B,
	output [31:0] Zlow, Zhigh,
);
	wire [63:0] mult_res;
	wire [31:0] ror_res, rol_res;
    wire [31:0] ror_res, rol_res;

    output reg [63:0] C // 64-bit output C


//intermediate signals
//ADD & SUB:
wire [31:0] sum, B_neg;
wire carry_out
//SHIFT:
wire [31:0] shr_result, shra_result, shl_result;
//LOGIC:
wire [31:0] lgcl_and_result, lgcl_or_result, lgcl_not_result, lgcl_neg_result;
//ROTATIONS:
wire [31:0] ror_result, rol_result


assign B_neg = ~B + 1;

//instatiation of funcs
//ADD & SUB (if this is being called and Add slect untrue its gonna need to use B_neg):
ripple_carry_adder rca ( A, 4'b0001  ? B: B_neg, sum, carry_out);
//SHIFT:
shr shift_right_logical (A, B,  shr_result);
shra shift_right_arithmetic (A, B,  shra_result);
sl shift_left_logical (A, B,  sl_result);
//LOGIC:
logical_and and(A, lgcl_and_result);
logical_or or(A, lgcl_or_result);
logical_neg neg(A, lgcl_neg_result);
logical_not not(A, lgcl_not_result);



//ROTATIONS:
ror rotate_right (A, B,  ror_result);
rol rotate_left (A, B,  rol_result);




	
	always @(*)
	begin
    // Reset C to 0 before doing more operations
    C = 64'b0;
		case(select)
			4'b0001: begin // ADD
				C[31:0] = sum
				C[32] = carry_out;
			end
			4'b0010: begin // SUB
				C[31:0] = sum
				C[32] = carry_out;
			end
			4'b0011: begin // MULT
								C = 0;

			end
			4'b0101: begin // DIV
				C = 0;

			end
			4'b0110: begin // AND
				C[31:0] = lgcl_and_result;

			end
			4'b0111: begin // OR
				C[31:0] = lgcl_or_result;

			end
			4'b1000: begin // NEG
				C[31:0] = lgcl_neg_result;
			end
			4'b1010: begin // NOT
				C[31:0] = lgcl_not_result;

			end
			4'b1011: begin // SHRA
                C[31:0] = shra_result;

			end
			4'b1100: begin // SHL
			    C[31:0] = shr_result;

                

			end
			4'b1101: begin // SHR
				C[31:0] = shr_result;

			end
			4'b1110: begin // ROL
				C[31:0] = rol_result;

			end
			4'b1111: begin // ROR
				C[31:0] = ror_result;

			end
			4'b1011: begin //incPC	
				C = 0;
			end
			default: begin
				
				C = 0;
			end
		endcase
	end
endmodule
