// Logical Shift right
module srl(input wire[31:0] a, input wire[4:0] b, output wire[31:0] result);

    logic [31:0] stage0, stage1, stage2, stage3, stage4;

    always_comb begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {1'b0, a[31:1]};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {2'b00, stage0[31:2]};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {4'b0000, stage1[31:4]};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {8'b000000000, stage2[31:8]};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {16'b00000000000000000, stage3[31:16]};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule


// Arithmetic shift right
module sra(input wire[31:0] a, input wire[4:0] b, output wire[31:0] result);

    logic [31:0] stage0, stage1, stage2, stage3, stage4;

    assign  0s = 16'1111111111111111,
    assign 1s = 16'b00000000000000000,

    logic [15:0] MSB;
    assign MSB  = a[31] ? 1s : 0s; 
 


    always_comb begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {MSB[0], a[31:1]};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {MSB[1:0], stage0[31:2]};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {MSB[3:0], stage1[31:4]};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {MSB[7:0], stage2[31:8]};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {MSB[15:0], stage3[31:16]};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule

// Logical Shift left 
module sll(input wire[31:0] a, input wire[4:0] b, output wire[31:0] result);

    logic [31:0] stage0, stage1, stage2, stage3, stage4;

    always_comb begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {a[30:0], 1'b0};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {stage0[29:0], 2'b00};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {stage1[27:0], 4'b0000};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {stage2[23:0], 8'b000000000};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {stage3[15:0], 16'b00000000000000000};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule