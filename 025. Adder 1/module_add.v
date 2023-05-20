module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire out0;
    wire [15:0] sum0, sum1;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(out0), .sum(sum0));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(out0), .cout(), .sum(sum1));
    
    assign sum = {sum1, sum0};
endmodule