module alu(
	input [3:0] select,
	input signed [31:0] A,
	input signed [31:0] B,
	output [31:0] Zlow, Zhigh,
	output carry
);
	wire [63:0] mult_res;
	wire [31:0] ror_res, rol_res;
	reg [31:0] RLo, RHi;
	assign Zlow = RLo;
	assign Zhigh = RHi;
	
	mult mult(mult_res, A, B);
	rotate_right ror(ror_res, A, B);
	rotate_left rol(rol_res, A, B);
	
	
	always @(*)
	begin
		case(select)
			4'b0001: begin // ADD
				RLo = A + B;
				RHi = 0;
			end
			4'b0010: begin // SUB
				RLo = A - B ;
				RHi = 0;
			end
			4'b0011: begin // MULT
				RLo = mult_res[31:0];
				RHi = mult_res[63:32];
			end
			4'b0101: begin // DIV
				RHi = A % B;
				RLo = (A - RHi) / B;
			end
			4'b0110: begin // AND
				RLo = A & B;
				RHi = 0;
			end
			4'b0111: begin // OR
				RLo = A | B;
				RHi = 0;
			end
			4'b1000: begin // NEG
				RLo = ~B + 1;
				RHi = 0;
			end
			4'b1010: begin // NOT
				RLo = ~B;
				RHi = 0;
			end
			4'b1011: begin // SHRA
				RLo = A >>> B;
				RHi = 0;
			end
			4'b1100: begin // SHL
				RLo = A << B;
				RHi = 0;
			end
			4'b1101: begin // SHR
				RLo = A >> B;
				RHi = 0;
			end
			4'b1110: begin // ROL
				RLo = rol_res;
				RHi = 0;
			end
			4'b1111: begin // ROR
				RLo = ror_res;
				RHi = 0;
			end
			4'b1011: begin //incPC	
				RLo = B + 1;
				RHi = 0;
			end
			default: begin
				RLo = B;
				RHi = 0;
			end
		endcase
	end
endmodule
