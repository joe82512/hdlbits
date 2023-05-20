module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0, mux1; //fixed
    mux2 mux_0 ( sel[0],    a,    b, mux0 ); //fixed
    mux2 mux_1 ( sel[0],    c,    d, mux1 ); //fixed
    mux2 mux_2 ( sel[1], mux0, mux1,  out ); //fixed

endmodule