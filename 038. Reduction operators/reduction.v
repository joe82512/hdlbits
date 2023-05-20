module top_module (
    input [7:0] in,
    output parity); 

    assign parity = ^in; //奇偶校驗, XOR all bits
endmodule