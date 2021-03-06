module adder_32(a, b, cin, sum, cout);
  input [31:0]a;
  input [31:0]b;
  input cin;
  output [31:0]sum;
  output cout;

  wire [32:0] cs;

  assign cs[0] = cin;
  adder_bit adder [31:0] (.a(a), .b(b), .cin(cs[31:0]), .sum(sum), .cout(cs[32:1]));
  assign cout = cs[32];
endmodule

module adder_36(a, b, cin, sum);
  input [35:0]a;
  input [35:0]b;
  input cin;
  output [35:0]sum;

  wire [36:0] cs;

  assign cs[0] = cin;
  adder_bit adder [35:0] (.a(a), .b(b), .cin(cs[35:0]), .sum(sum), .cout(cs[36:1]));
endmodule