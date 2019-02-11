// define timescale and precision
//`timescale 1ns/1ps
//
module feachTB;
	reg signed [31:0] x;
	reg [4:0] y;
	wire [35:0] result;
	// wire [31:0] temp1no;

	foureach tester (.x(x), .y(y), .result(result));//, .temp1no(temp1no));

	initial	begin

	$monitor("Mult %d and %b. Temp is %b. Got %d.", x, y, temp1no, result);

	#0 x = 32'd3; y = 5'b01010;
	#1 x = 32'd2; y = 5'b01100;

	end

endmodule
























