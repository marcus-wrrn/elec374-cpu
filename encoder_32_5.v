module encoder_32_5(
    input [31:0] encoder_input,
    output reg [4:0] encoder_output
)

integer i;

always @(encoder_input) begin
    encoder_output = 5'd31;
    for (i = 0; i <= 23; i = i + 1) begin
        if (encoder_input[i]) begin
            encoder_output = i;
        end
    end
end
endmodule