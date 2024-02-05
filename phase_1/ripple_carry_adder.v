module ripple_carry_adder(
    //32 bit inputs, output and a single bit for carry
    input [31:0] in0, 
    input [31:0] in1,
    output [31:0] out,
    output carryout
);

// Internal carry wires to connect the full adders
wire [30:0] carry; 

// Instantiate the full adders
full_adder fa0 (in0[0], in1[0], 0, out[0], carry[0]);
full_adder fa1 (in0[1], in1[1], carry[0], out[1], carry[1]);
full_adder fa2 (in0[2], in1[2], carry[1], out[2], carry[2]);
full_adder fa3 (in0[3], in1[3], carry[2], out[3], carry[3]);
full_adder fa4 (in0[4], in1[4], carry[3], out[4], carry[4]);
full_adder fa5 (in0[5], in1[5], carry[4], out[5], carry[5]);
full_adder fa6 (in0[6], in1[6], carry[5], out[6], carry[6]);
full_adder fa7 (in0[7], in1[7], carry[6], out[7], carry[7]);
full_adder fa8 (in0[8], in1[8], carry[7], out[8], carry[8]);
full_adder fa9 (in0[9], in1[9], carry[8], out[9], carry[9]);
full_adder fa10 (in0[10], in1[10], carry[9], out[10], carry[10]);
full_adder fa11 (in0[11], in1[11], carry[10], out[11], carry[11]);
full_adder fa12 (in0[12], in1[12], carry[11], out[12], carry[12]);
full_adder fa13 (in0[13], in1[13], carry[12], out[13], carry[13]);
full_adder fa14 (in0[14], in1[14], carry[13], out[14], carry[14]);
full_adder fa15 (in0[15], in1[15], carry[14], out[15], carry[15]);
full_adder fa16 (in0[16], in1[16], carry[15], out[16], carry[16]);
full_adder fa17 (in0[17], in1[17], carry[16], out[17], carry[17]);
full_adder fa18 (in0[18], in1[18], carry[17], out[18], carry[18]);
full_adder fa19 (in0[19], in1[19], carry[18], out[19], carry[19]);
full_adder fa20 (in0[20], in1[20], carry[19], out[20], carry[20]);
full_adder fa21 (in0[21], in1[21], carry[20], out[21], carry[21]);
full_adder fa22 (in0[22], in1[22], carry[21], out[22], carry[22]);
full_adder fa23 (in0[23], in1[23], carry[22], out[23], carry[23]);
full_adder fa24 (in0[24], in1[24], carry[23], out[24], carry[24]);
full_adder fa25 (in0[25], in1[25], carry[24], out[25], carry[25]);
full_adder fa26 (in0[26], in1[26], carry[25], out[26], carry[26]);
full_adder fa27 (in0[27], in1[27], carry[26], out[27], carry[27]);
full_adder fa28 (in0[28], in1[28], carry[27], out[28], carry[28]);
full_adder fa29 (in0[29], in1[29], carry[28], out[29], carry[29]);
full_adder fa30 (in0[30], in1[30], carry[29], out[30], carry[30]);
full_adder fa31(in0[31], in1[31], carry[30], out[31], carryout);


end module