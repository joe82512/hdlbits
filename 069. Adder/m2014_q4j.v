module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    //assign sum = x+y;
    wire [2:0] cout;
    FA inst0(.a(x[0]), .b(y[0]), .cin(1'b0), .cout(cout[0]), .sum(sum[0]));
    FA inst1(.a(x[1]), .b(y[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    FA inst2(.a(x[2]), .b(y[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
    FA inst3(.a(x[3]), .b(y[3]), .cin(cout[2]), .cout(sum[4]), .sum(sum[3]));
endmodule

module FA (
	input a, b, cin,
    output cout, sum);
    
    assign {cout,sum} = a+b+cin;
endmodule