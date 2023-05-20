module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  ); //fixed

    assign out = (sel) ? a:b ; //fixed

endmodule