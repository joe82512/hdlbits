module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire w;
    // cin(sub) -> 2's +1
    add16 inst1(.a(a[15:0]), .b(b[15:0]^{32{sub}}), .cin(sub), .cout(w), .sum(sum[15:0]));
    add16 inst2(.a(a[31:16]), .b(b[31:16]^{32{sub}}), .cin(w), .cout(), .sum(sum[31:16]));
endmodule