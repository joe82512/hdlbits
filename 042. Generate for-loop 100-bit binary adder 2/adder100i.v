module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

	//integer i;
    always @(*) begin
        for (int i=0;i<100;i++) begin
            if (i==0) begin
                {cout[i],sum[i]} = a[i]+b[i]+cin;
            end
            else begin
                {cout[i],sum[i]} = a[i]+b[i]+cout[i-1];
            end
        end
    end
/*
	generate
        genvar i;
        for (i=0;i<100;i++) begin:adder
            if (i==0) begin
                assign {cout[i],sum[i]} = a[i]+b[i]+cin;
            end
        	else begin
                assign {cout[i],sum[i]} = a[i]+b[i]+cout[i-1];
            end
        end
    endgenerate
*/
endmodule