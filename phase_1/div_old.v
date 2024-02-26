module div(input [31:0] in_a, in_b, output reg[63:0] out);
    // Implements non restoring division
    reg [31:0] m, q;
    reg [32:0] a;
    reg [32:0] abs_a;

    integer i;
    always @(*) begin

       if (in_a[31] == 1) begin
            abs_a = -in_a;
       end 
       else begin
            abs_a = in_a;
       end

        q = abs_a;
        m = in_b;
        a = 0;

        for (i = 0; i < 32; i = i + 1) begin
            a = {a[30:0], q[31]};
            q[31:1] = q[30:0];

            if(a[31] == 0) begin
                a = a - m;
            end
            else begin
                a = a + m;
            end
            if(a[31] == 0) begin
                q[0] = 1;
            end
            else begin
                q[0] = 0;
            end
        end

        if (a[31] == 1) begin
            a = a + m;
        end
        if (in_a[31] == 1) begin
            q = -q;
        end

        out[31:0] = q[31:0];
        out[63:32] = a[31:0];
    end
endmodule