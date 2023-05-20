module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    MUXDFF mux3 (KEY[0], KEY[2], KEY[1], SW[3], KEY[3], LEDR[3]);
    MUXDFF mux2 (KEY[0], KEY[2], KEY[1], SW[2], LEDR[3], LEDR[2]);
    MUXDFF mux1 (KEY[0], KEY[2], KEY[1], SW[1], LEDR[2], LEDR[1]);
    MUXDFF mux0 (KEY[0], KEY[2], KEY[1], SW[0], LEDR[1], LEDR[0]);
endmodule

module MUXDFF (
    input clk,L,E,R,w,
    output Q
);

    always @(posedge clk) begin
        if (L)
            Q <= R;
        else
            Q <= (E)? w:Q;
    end
endmodule