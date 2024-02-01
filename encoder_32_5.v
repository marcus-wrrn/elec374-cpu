module encoder_32_5(
    input [31:0] encoderInput,
    output reg [4:0] encoderOutput
)

integer i;

always @(encoderInput) begin
    encoderOutput = 5'd31;
    for (i = 0; i < 24; i = i + 1) begin
        if (encoderInput[i]) begin
            encoderOutput = i;
            break;
        end
    end
end
endmodule