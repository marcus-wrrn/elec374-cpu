`timescale 1ns/10ps

module control_unit (
    input clk,
    input reset,
    input stop,
    input con_ff,
    input [31:0] ir,

    output reg inport_out,
    output reg read,
    output reg write,
    // operations

    // signals
    output reg hi_enable,
    output reg lo_enable,
    output reg con_enable,
    output reg pc_enable,
    output reg ir_enable,
    output reg y_enable,
    output reg z_enable,
    output reg mar_enable,
    output reg mdr_enable,
    output reg outport_enable,
    output reg c_sign_extended_out, // cout?
    output reg ba_out,

    output reg gra,
    output reg grb,
    output reg grc,
    output reg r_in,
    output reg r_out,
    output reg hi_out,
    output reg lo_out,
    output reg zhi_out,
    output reg zlo_out,
    output reg mdr_out,
    output reg pc_out,

    output reg pc_increment,
    output reg y_clr,
    output reg ir_clr
);

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
localparam branch_opcode = 5'b10011;
localparam jr_opcode = 5'b10100;
localparam jal_opcode = 5'b10101;
localparam nop_opcode = 5'b11010;

// FSM signals
parameter reset_state = 6'b000000;
parameter fetch0 = 6'b000001;
parameter fetch1 = 6'b000010;
parameter fetch2 = 6'b000011;
parameter ld3 = 6'b000100;            // ld
parameter ld4 = 6'b000101;
parameter ld5 = 6'b000110;
parameter ld6 = 6'b000111;
parameter ld7 = 6'b001000;
parameter ldi3 = 6'b001001;           // ldi
parameter ldi4 = 6'b001010;
parameter ldi5 = 6'b001011;
parameter br3 = 6'b001100;            // br
parameter br4 = 6'b001101;
parameter br5 = 6'b001110;
parameter br6 = 6'b001111;
parameter nop3 = 6'b010000;           // nop
parameter add3 = 6'b010001;           // add
parameter add4 = 6'b010010;
parameter add5 = 6'b010011;
parameter addi_andi_ori3 = 6'b010100;          // addi, andi & ori
parameter addi_andi_ori4 = 6'b010101;
parameter addi_andi_ori5 = 6'b010110;
parameter neg_not3 = 6'b010111;           // neg & not
parameter neg_not4 = 6'b011000;
parameter andi3 = 6'b011001;          // andi
parameter andi4 = 6'b011010;


reg [5:0] present_state = reset_state;


reg toggle = 0; // Initialize the toggle flip-flop
always @(posedge clk, posedge reset) begin
    if (reset == 1'b1) begin
        present_state <= reset_state; // Use non-blocking assignment in sequential logic
        toggle <= 0; // Reset the toggle to 0 on reset
    end
    else begin
        toggle <= ~toggle; // Toggle the flip-flop on each clock edge
        if (toggle) begin // Proceed with state transitions only when toggle is high
            case (present_state)
                reset_state: present_state <= fetch0;
                fetch0: present_state <= fetch1;
                fetch1: present_state <= fetch2;
                fetch2: begin 
                    case (ir[31:27])
                        ld_opcode:      present_state <= ld3;
                        ldi_opcode:     present_state <= ldi3;
                        branch_opcode:  present_state <= br3;
                        nop_opcode:     present_state <= nop3;
                        add_opcode:     present_state <= add3;
                        addi_opcode:    present_state <= addi_andi_ori3;
                        andi_opcode:    present_state <= addi_andi_ori3;
                        ori_opcode:     present_state <= addi_andi_ori3;
                        neg_opcode:     present_state <= neg_not3;
                        not_opcode:     present_state <= neg_not3;
                        // TODO: Additional opcodes

                    endcase
                end
                // Continue with other states as before
                // ld
                ld3: present_state <= ld4;
                ld4: present_state <= ld5;
                ld5: present_state <= ld6;
                ld6: present_state <= ld7;
                ld7: present_state <= fetch0;
                // ldi
                ldi3: present_state <= ldi4;
                ldi4: present_state <= ldi5;
                ldi5: present_state <= fetch0;
                // br
                br3: present_state <= br4;
                br4: present_state <= br5;
                br5: present_state <= br6;
                br6: present_state <= fetch0;
                // nop
                nop3: present_state <= fetch0;
                // add
                add3: present_state <= add4;
                add4: present_state <= add5;
                add5: present_state <= fetch0;
                // addi
                addi_andi_ori3: present_state <= addi_andi_ori4;
                addi_andi_ori4: present_state <= addi_andi_ori5;
                addi_andi_ori5: present_state <= fetch0;
                // neg
                neg_not3: present_state <= neg_not4;
                neg_not4: present_state <= fetch0;

                // TODO: FILL IN PRESENT STATES EX: add3: present_state <= add4;
                // Make sure to use non-blocking assignments (<=) within always blocks
            endcase
        end
        // When toggle is low, do not change the present_state
    end
end


always @(present_state)
begin
    case(present_state)
        reset_state: begin
            // reset = 0;
            inport_out = 0;
            read = 0;
            write = 0;
            hi_enable = 0;
            lo_enable = 0;
            con_enable = 0;
            pc_enable = 0;
            ir_enable = 0;
            y_enable = 0;
            z_enable = 0;
            mar_enable = 0;
            mdr_enable = 0;
            outport_enable = 0;
            c_sign_extended_out = 0;
            ba_out = 0;
            gra = 0;
            grb = 0;
            grc = 0;
            r_in = 0;
            r_out = 0;
            hi_out = 0;
            lo_out = 0;
            zhi_out = 0;
            zlo_out = 0;
            mdr_out = 0;
            pc_out = 0;
        end
		fetch0: begin
			pc_out <= 1; mar_enable <= 1; pc_increment <= 1; ir_clr <= 1; y_clr <= 1; //ir_clr???? maybe add y_clr too
			#20 mar_enable <= 0; pc_increment <= 0; ir_clr <= 0; y_clr <= 0; z_enable <= 1; //ir_clr????
			#20 pc_out <= 0; z_enable <= 0;
		end
		fetch1: begin
			read <= 1; mdr_enable <= 1; pc_enable <= 1; zlo_out <= 1;
			#20 read <= 0; mdr_enable <= 0; pc_enable <= 0; zlo_out <= 0;
		end
		fetch2: begin
			mdr_out <= 1; ir_enable <= 1;
			#20 mdr_out<= 0; ir_enable <= 0;
		end

        // ld instruction
        ld3: begin
			grb <= 1; ba_out <= 1; y_enable <= 1;
			#20 grb <= 0; ba_out <= 0; y_enable <= 0;
		end
		ld4: begin
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end
		ld5: begin
			zlo_out <= 1; mar_enable <= 1;
			#20 zlo_out <= 0; mar_enable <= 0;  
		end
		ld6: begin
			read <= 1; mdr_enable <= 1;
			#20 read <= 0; mdr_enable <= 0;
		end
		ld7: begin
			mdr_out <= 1; gra <= 1; r_in <= 1;
			#20 mdr_out <= 0; gra <= 0; r_in <= 0;
		end

        // ldi instruction
        ldi3: begin	
			grb <= 1; ba_out <= 1; y_enable <= 1;
			#20 grb <= 0; ba_out <= 0; y_enable <= 0;
		end
		ldi4: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end
		ldi5: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end

        // brmi instruction
        br3: begin	
			gra <= 1; r_out <= 1; con_enable <= 1;
            #20 gra <= 0; r_out <= 0; con_enable <= 0;
		end
        br4: begin
            pc_out <= 1; y_enable <= 1;
            #20 pc_out <= 0; y_enable <= 0;
        end
        br5: begin
            c_sign_extended_out <= 1; z_enable <= 1;
            #20 c_sign_extended_out <= 0; z_enable <= 0;
        end
        br6: begin
            if (con_ff == 1) begin
                zlo_out <= 1; pc_enable <= 1; 
                #20 zlo_out <= 0; pc_enable <= 0; //pc_increment <= 1;
                //#20 pc_increment <= 0;
            end
            else begin
                zlo_out <= 1;
                #20 zlo_out <= 0;
            end
        end

        // nop instruction
        nop3: begin
            #40; // Do nothing
        end

        // add instruction
        add3: begin
            grb <= 1; r_out <= 1; y_enable <= 1;
            #20 grb <= 0; r_out <= 0; y_enable <= 0;
        end
        add4: begin
            grc <= 1; r_out <= 1; z_enable <= 1;
            #20 grc <= 0; r_out <= 0; z_enable <= 0;
        end
        add5: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end

        // addi instruction
        addi_andi_ori3: begin	
			grb <= 1; r_out <= 1; y_enable <= 1;
			#20 grb <= 0; r_out <= 0; y_enable <= 0;
		end
		addi_andi_ori4: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end
		addi_andi_ori5: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end

        // neg instruction
        neg_not3: begin
            grb <= 1; r_out <= 1; z_enable <= 1;
            #20 grb <= 0; r_out <= 0; z_enable <= 0;
        end
        neg_not4: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end
        // TODO: FILL IN JOBS
    endcase
end
endmodule