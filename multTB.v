// define timescale and precision
//`timescale 1ns/1ps
//
module multTB;
	reg signed [31:0] A;
	reg signed [31:0] B;
	reg start;
	reg clk;
	wire ready;
	wire signed [63:0] out;
	
	mult AGH(.A(A), .B(B), .start(start), .clk(clk), .ready(ready), .out(out));

	initial	begin
	clk = 1'b0;
	$monitor("Mult %d times %d equals %d? Start: %b. Ready: %b.", A, B, out, start, ready);

	#0 A = 32'd4848; B = 32'd5151; start = 1'b1;
	#3 start = 1'b0;
	#16 A = 32'd11; B = 32'd7; start = 1'b1;
	#2 start = 1'b0;
	#16 A = -32'd2838594; B = 32'd74; start = 1'b1;
	#2 start = 1'b0;
	#16 A = -32'd2; B = -32'd7; start = 1'b1;
	#2 start = 1'b0;
	#16 A = 32'd100; B = -32'd89; start = 1'b1;
	#2 start = 1'b0;
	#16 A = 32'd0; B = 32'd23875; start = 1'b1;
	#2 start = 1'b0;
	#16 $finish;
	end

	always #1 clk = ~clk;
endmodule
























