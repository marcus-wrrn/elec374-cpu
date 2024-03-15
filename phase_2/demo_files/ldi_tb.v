`timescale 1ns/10ps

module ldi_tb; 	
reg pc_out; 
reg zlo_out; 
reg zhi_out;
reg mdr_out; 
reg mar_enable; 
reg z_enable;
reg lo_enable;
reg hi_enable;
reg pc_enable; 
reg mdr_enable; 
reg read;
reg ir_enable; 
reg y_enable;
reg pc_increment; 
reg r1_enable; 
reg r2_enable; 
reg r3_enable;
reg r4_enable;
reg r5_enable;
reg r6_enable;
reg r7_enable;
reg r2_out;
reg r3_out;
reg r4_out;
reg r5_out;
reg r6_out;
reg r7_out;
reg c_sign_extended_out;
reg clk; 
reg clr;
reg con_enable;
reg ram_write;
reg r_in;
reg r_out;
reg gra;
reg grb;
reg grc;
reg ba_out;
// reg [4:0] op_code; 
// reg [31:0] m_data_in;
wire [31:0] zlo_data;

// FSM signals
parameter start = 4'b0000; 
parameter T0 = 4'b0001; 
parameter T1 = 4'b0010; 
parameter T2 = 4'b0011; 
parameter T3 = 4'b0100; 
parameter T4 = 4'b0101; 
parameter T5 = 4'b0110; 
parameter T6 = 4'b0111; 
parameter T7 = 4'b1000;

reg	[3:0] present_state = start;

// Opcodes for operations
parameter ld_opcode = 5'b00000;
parameter ldi_opcode = 5'b00001;
parameter st_opcode = 5'b00010;
parameter add_opcode = 5'b00011;
parameter sub_opcode = 5'b00100;
parameter shr_opcode = 5'b00101;
parameter shra_opcode = 5'b00110;
parameter shl_opcode = 5'b00111;
parameter ror_opcode = 5'b01000;
parameter rol_opcode = 5'b01001;
parameter and_opcode = 5'b01010;
parameter or_opcode = 5'b01011;
parameter addi_opcode = 5'b01100;
parameter andi_opcode = 5'b01101;
parameter ori_opcode = 5'b01110;
parameter mul_opcode = 5'b01111;
parameter div_opcode = 5'b10000;
parameter neg_opcode = 5'b10001;
parameter not_opcode = 5'b10010;

// Instantiate the DUT
datapath DUT(
	.pc_out(pc_out), 
	.zlo_out(zlo_out), 
	.zhi_out(zhi_out),
	.mdr_out(mdr_out), 
	.mar_enable(mar_enable), 
	.z_enable(z_enable), 
	.pc_enable(pc_enable), 
	.mdr_enable(mdr_enable), 
	.read(read), 
	.ir_enable(ir_enable), 
	.y_enable(y_enable), 
	.pc_increment(pc_increment),
	.r1_enable(r1_enable),
	.r2_enable(r2_enable),
	.r3_enable(r3_enable),
	.r4_enable(r4_enable),
	.r5_enable(r5_enable),
	.r6_enable(r6_enable),
	.r7_enable(r7_enable),
	.lo_enable(lo_enable),
	.hi_enable(hi_enable),
	.r2_out(r2_out),
	.r3_out(r3_out),
	.r4_out(r4_out),
	.r5_out(r5_out),
	.r6_out(r6_out),
	.r7_out(r7_out),
	.c_sign_extended_out(c_sign_extended_out),
	.clr(clr), 
	.clk(clk),
    .con_enable(con_enable),
    .ram_write(ram_write),
    .r_in(r_in),
    .r_out(r_out),
    .gra(gra),
    .grb(grb),
    .grc(grc),
    .ba_out(ba_out),
    // .op_code(op_code),
	// .m_data_in(m_data_in),
	.zlo_data(zlo_data)
);

// Initialize the clock signals
initial begin
	clk = 0;
	clr = 0;
	forever #10 clk = ~ clk;
end

// FSM changes on positive edge of clock every two clock cycles
reg toggle = 0;

// Toggle the counter on every clock cycle
always @(posedge clk)
begin
    toggle <= ~toggle;
end

always @(posedge clk)
begin
    if (toggle == 1)  // Check if toggle is set to change the state
    begin
        case (present_state)
            start       : present_state = T0;
            T0  		: present_state = T1;
            T1  		: present_state = T2;
            T2  		: present_state = T3;
            T3  		: present_state = T4;
            T4  		: present_state = T5;
            T5  		: present_state = T6;
            T6          : present_state = T7;
        endcase
    end
end

always @(present_state)
begin
	case (present_state)
		// present_state: 0
		// Set all signals to 0
		start: begin	
			pc_out <= 0; zlo_out <= 0; zhi_out <= 0; lo_enable <= 0; hi_enable <= 0; mdr_out <= 0;
			r2_out <= 0; r3_out <= 0; r4_out <= 0; r5_out <= 0; r6_out <= 0; r7_out <= 0;
			pc_enable <= 0; mdr_enable <= 0; mar_enable <= 0; 
			ir_enable <= 0; y_enable <= 0; pc_increment <= 0;   
			read <= 0;  z_enable <= 0; //op_code <= 0;
			r1_enable <= 0; r2_enable <= 0; r3_enable <= 0; r4_enable <= 0; r5_enable <= 0; r6_enable <= 0; r7_enable <= 0;
			// m_data_in <= 32'h00000000;
			con_enable <= 0; ram_write <= 0; r_in <= 0; r_out <= 0; gra <= 0; grb <= 0; grc <= 0; ba_out <= 0;
			c_sign_extended_out <= 0;
		end
		
		// present_state: 1
		T0: begin
			pc_out <= 1; mar_enable <= 1; pc_increment <= 1; 
			#20 mar_enable <= 0; pc_increment <= 0; z_enable <= 1;
			#20 pc_out <= 0; z_enable <= 0;
		end

		// present_state: 2
		T1: begin
			// case 1: m_data_in <= 32'b00000_0010_0000_0000000000010010101;
			read <= 1; mdr_enable <= 1; pc_enable <= 1; zlo_out <= 1;
			#20 read <= 0; mdr_enable <= 0; pc_enable <= 0; zlo_out <= 0;
		end

		// present_state: 3
		T2: begin
			mdr_out <= 1; ir_enable <= 1; 
			#20 mdr_out<= 0; ir_enable <= 0;
		end

		// present_state: 4
		T3: begin	
			grb <= 1; ba_out <= 1; y_enable <= 1;
			#20 grb <= 0; ba_out <= 0; y_enable <= 0;
		end

		// present_state: 5
		T4: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end

		// present_state: 6
		T5: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end
	endcase
end
endmodule