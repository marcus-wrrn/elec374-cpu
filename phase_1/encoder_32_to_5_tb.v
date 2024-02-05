`timescale 1ns / 1ps

module encoder_32_to_5_tb;

    parameter DATA_WIDTH = 32;
    parameter OUTPUT_WIDTH = 5;
    parameter TEST_DELAY = 10; // ns
    parameter INVALID_INPUT_THRESHOLD = 24; // At this bit index, inputs are considered invalid

    // Instantiate the input and output of testbench
    reg [DATA_WIDTH-1:0] encoder_in;
    wire [OUTPUT_WIDTH-1:0] encoder_out;

    // Instantiate the Unit Under Test (UUT)
    encoder_32_to_5 uut (
        .encoder_in(encoder_in),
        .encoder_out(encoder_out)
    );

    // Test stimulus
    integer i;  // Bit index
    reg [OUTPUT_WIDTH-1:0] expected;
    initial begin
        // Initialize Inputs
        encoder_in = 0;

        // Wait for global reset to finish
        #100;

        // Apply test vectors
        for (i = -1; i < DATA_WIDTH; i = i + 1) begin
            encoder_in = 0; // Clear all bits
            if (i >= 0 && i < INVALID_INPUT_THRESHOLD) begin
                encoder_in[i] = 1'b1;   // Set the bit at index i
                expected = i + 1;       // Expected output is bit index + 1 for valid inputs
            end else if (i >= INVALID_INPUT_THRESHOLD) begin
                encoder_in[i] = 1'b1;   // Set the bit at index i
                expected = 5'b11111;    // Expected output is 31 in 5-bit binary for invalid inputs
            end else begin
                expected = 0;           // Expected output for all 0's input
            end
            #TEST_DELAY;                // Wait for the change to propagate
            
            // Assertion for automatic verification
            if (encoder_out !== expected) begin
                $display("Test failed for input: %b. Expected Output: %d, Actual Output: %d", encoder_in, expected, encoder_out);
                $finish; // Stop simulation on failure
            end else begin
                $display("Test passed for input: %b. Expected Output: %d, Actual Output: %d", encoder_in, expected, encoder_out);
            end
        end

        $display("All tests passed.");
        $finish; // End simulation after all tests
    end

endmodule
