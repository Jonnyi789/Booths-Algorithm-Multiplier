// n-bit NOT gate
module not_n(a, out);
  parameter n = 1;
  input [n-1:0] a;
  output [n-1:0] out;

  assign out = ~a;
endmodule

// n-bit AND gate
module and_n(a, b, out);
  parameter n = 1;
  input [n-1:0]a;
  input [n-1:0]b;
  output [n-1:0]out;

  assign out = a & b;
endmodule

// n-bit XOR gate
module xor_n(a, b, out);
  parameter n = 1;
  input [n-1:0]a;
  input [n-1:0]b;
  output [n-1:0]out;

  assign out = a ^ b;
endmodule

// n-bit OR gate
module or_n(a, b, out);
  parameter n = 1;
  input [n-1:0]a;
  input [n-1:0]b;
  output [n-1:0]out;

  assign out = a | b;
endmodule

// n-bit MUX
module mux_n(s, s0, s1, out);
  parameter n = 1;
  input s;
  input [n-1:0] s0;
  input [n-1:0] s1;
  output [n-1:0] out;

  assign out = (s == 0) ? s0 : s1;
endmodule

// a 32-bit logic module
// AND: 00, OR: 01, XOR: 10
module logics(opCode, a, b, out);
  input [1:0] opCode;
  input [31:0] a;
  input [31:0] b;
  output [31:0] out;

  wire [31:0] andOut;
  wire [31:0] orOut;
  wire [31:0] xorOut;

  wire [31:0] muxOut;

  and_n #(32) andGate (.a(a), .b(b), .out(andOut));
  or_n #(32) orGate (.a(a), .b(b), .out(orOut));
  xor_n #(32) xorGate (.a(a), .b(b), .out(xorOut));

  mux_n #(32) mux1 (.s(opCode[0]), .s0(andOut), .s1(orOut), .out(muxOut));
  mux_n #(32) mux2 (.s(opCode[1]), .s0(muxOut), .s1(xorOut), .out(out));

endmodule

/*

// a 32-bit isZero module
module isZero(in, out);
  input [31:0] in;
  output out;

  always
  begin
    if(in == 32'b0)
      assign out = 1'b1;
    else
      assign out = 1'b0;
  end

endmodule

// a conditional logic module
// returns 32-bit boolean
// SEQ: 000, SNE: 001, SLT: 011, SGT: 101, SLE: 010, SGE: 100
module condLogics(opCode, aluOut, aluC, out);
  input [2:0] opCode;
  input [31:0] aluOut;
  input aluC;
  output [31:0] out;

  wire Z, N, V, notZ, xorNV, nxorNV;
  wire seq, sne, slt, sgt, sle, sge, outBit;

  // Calculates Z, N, and V
  isZero zero (.in(aluOut), .out(Z));
  assign N = aluOut[31];
  xor_n Vxor (.a(N), .b(aluC), .out(V));

  // Calculates notZ, xorNV, and nxorNV
  not_n Znot (.a(Z), .out(notZ));
  xor_n NVxor (.a(N), .b(V), .out(xorNV));
  not_n NVnxor (.a(xorNV), .out(nxorNV));

  // Calculates seq, sne, slt, sgt, sle, and sge
  assign seq = Z;
  assign sne = notZ;
  assign slt = xorNV;
  and_n sgtAND (.a(notZ), .b(nxorNV), .out(sgt));
  or_n sleOR (.a(z), .b(xorNV), .out(sle));
  assign sge = nxorNV;

  // Selects which output we want
  always
  begin
    case (opCode)
      3'b000: outBit = seq;
      3'b001: outBit = sne;
      3'b011: outBit = slt;
      3'b101: outBit = sgt;
      3'b010: outBit = sle;
      3'b100: outBit = sge;
    endcase
  end

  assign out = {31'b0, outBit};

endmodule

*/


















