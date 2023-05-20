module top_module( 
    input [99:0] in,
    output [99:0] out
);

    //integer i;
    always @(*) begin
        for (int i=0;i<=99;i=i+1)
            out[i] = in[99-i]; //not assign
    end  
endmodule