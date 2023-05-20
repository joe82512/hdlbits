module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] d1,d2,d3;
    //my_dff8 inst1(clk,d,d1);
    my_dff8 inst1(.clk(clk), .d(d), .q(d1) );
    my_dff8 inst2(.clk(clk), .d(d1), .q(d2) );
    my_dff8 inst3(.clk(clk), .d(d2), .q(d3) );
    
    always @(*)
        case (sel)
            2'b00:q = d;
            2'b01:q = d1;
            2'b10:q = d2;
            2'b11:q = d3;
        endcase
endmodule