`timescale 1ns/10ps

module datapath_tb;
    reg pc_out;
    reg pc_enable;
    reg zlo_out; 
    reg mdr_out;
    reg mdr_enable;
    reg mar_in;
    reg r2_out;
    reg r3_out;
    reg zlo_enable;
    reg pc_enable;
    reg ir_enable;
    reg y_enable;
    reg pc_increment;
    reg read;
    reg [4:0] select_encoded;
    reg r1_in;
    reg r2_in;
    reg r3_in;
    reg clk;
    reg [31:0] m_data_in;   // Data being fed into the datapath

    // Finite state machine states
    parameter default_state = 4'b0000;  // initial state of FSM
    parameter reg_load_1a = 4'b0001;    // "reg_load_#a" initiation of a load operation of register #
    parameter reg_load_1b = 4'b0010;    // "reg_load_#b" completion of a load operation of register #
    parameter reg_load_2a = 4'b0011;
    parameter reg_load_2b = 4'b0100;
    parameter reg_load_3a = 4'b0101;
    parameter reg_load_3b = 4'b0110;
    parameter t0 = 4'b0111;             // T0 to T5 simulate the execution of an AND operation between registers R1, R2, and R3.
    parameter t1 = 4'b1000;
    parameter t2 = 4'b1001;
    parameter t3 = 4'b1010;
    parameter t4 = 4'b1011;
    parameter t5 = 4'b1100;

    reg [3:0] present_state = default_state;

    datapath dut(
        .pc_out(pc_out),
        .zlo_out(zlo_out),
        .mdr_out(mdr_out),
        .r2_out(r2_out),
        .r3_out(r3_out),
        .mar_in(mar_in),
        .z_in(z_in),
        .pc_in(pc_in),
        .mdr_enable(mdr_enable),
        .ir_in(ir_in),
        .y_in(y_in),
        .inc_pc(inc_pc),
        .read(read),
        .select_encoded(select_encoded),
        .r1_in(r1_in),
        .r2_in(r2_in),
        .r3_in(r3_in),
        .clk(clk),
        .m_data_in(m_data_in)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Finite state machine, if clock rising-edge, change state
    always @(posedge clk) begin
        case(present_state)
            default_state   : present_state = reg_load_1a;  // sequentially load registers R1, R2, and R3
            reg_load_1a     : present_state = reg_load_1b;
            reg_load_1b     : present_state = reg_load_2a;
            reg_load_2a     : present_state = reg_load_2b;
            reg_load_2b     : present_state = reg_load_3a;
            reg_load_3a     : present_state = reg_load_3b;
            reg_load_3b     : present_state = t0;           // T0 to T5 simulate the execution of an AND operation between registers R1, R2, and R3.
            t0              : present_state = t1;
            t1              : present_state = t2;     
            t2              : present_state = t3;
            t3              : present_state = t4;
            t4              : present_state = t5;
        endcase
    end

    always @(present_state) begin   // do the required job in each state 
        case (present_state)        // assert the required signals in each clock cycle 
            default_state: begin    // initialize the signals
                pc_out <= 0;
                zlo_out <= 0;
                mdr_out <= 0;         
                r2_out <= 0;
                r3_out <= 0;
                mar_in <= 0;
                z_in <= 0;
                pc_in <=0;
                mdr_enable <= 0;
                ir_in  <= 0;
                y_in <= 0;   
                inc_pc <= 0;
                read <= 0;
                and_signal <= 0; 
                r1_in <= 0;
                r2_in <= 0;
                r3_in <= 0;
                m_data_in <= 32'h00000000;
            end

            reg_load_1a: begin
                m_data_in <= 32'h00000012; 
                read = 0;
                mdr_enable = 0;                   // the first zero is there for completeness 
                #10 
                read <= 1;
                mdr_enable <= 1;
                #15 
                read <= 0;
                mdr_enable <= 0;
            end 

            reg_load_1b: begin  
                #10 
                mdr_out <= 1;
                r2_in <= 1;   
                #15
                mdr_out <= 0;
                r2_in <= 0;     // initialize R2 with the value $12           
            end 

            reg_load_2a: begin   
                m_data_in <= 32'h00000014; 
                #10
                read <= 1;
                mdr_enable <= 1;   
                #15
                read <= 0;
                mdr_enable <= 0;       
            end 

            reg_load_2b: begin  
                #10 
                mdr_out <= 1; 
                r3_in <= 1;   
                #15 
                mdr_out <= 0; 
                r3_in <= 0; // initialize R3 with the value $14           
            end 

            reg_load_3a: begin   
                m_data_in <= 32'h00000018; 
                #10 
                read <= 1; 
                mdr_enable <= 1;   
                #15 read <= 0; 
                mdr_enable <= 0; 
            end 
            reg_load_3b: begin  
                #10 
                mdr_out <= 1; 
                r1_in <= 1;   
                #15 
                mdr_out <= 0; 
                r1_in <= 0; // initialize R1 with the value $18           
            end 
            t0: begin                                                                                  // see if you need to de-assert these signals 
                pc_out <= 1; 
                mar_in <= 1; 
                inc_pc <= 1; 
                z_in <= 1;   
            end 
            t1: begin 
                zlo_out <= 1; 
                pc_in <= 1; 
                read <= 1; 
                mdr_enable <= 1;   
                m_data_in <= 32'h28918000;     // opcode for “and R1, R2, R3” 
            end 

            t2: begin 
                mdr_out <= 1; 
                ir_in <= 1;    
            end 

            t3: begin 
                r2_out <= 1; 
                y_in <= 1;    
            end 
            
            t4: begin 
                r3_out <= 1; 
                and_signal <= 1; 
                z_in <= 1;    
            end 

            t5: begin 
                zlo_out <= 1; 
                r1_in <= 1;    
            end 
        endcase 
    end 

endmodule