module top_module( 
    input [7:0] in,
    output [7:0] out
);
	generate
        genvar i;
        for (i=0;i<8;i++) begin:conv
            assign out[i] = in[7-i];
        end
    endgenerate
endmodule