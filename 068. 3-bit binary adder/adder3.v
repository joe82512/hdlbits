module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
/*
    always @(*) begin
        {cout[0],sum[0]} = a[0]+b[0]+cin;
        for (int i=1;i<3;i++)
        	{cout[i],sum[i]} = a[i]+b[i]+cout[i-1];
    end
*/
    add inst0(a[0],b[0],cin,cout[0],sum[0]);
    add inst1(a[1],b[1],cout[0],cout[1],sum[1]);
    add inst2(a[2],b[2],cout[1],cout[2],sum[2]);
endmodule

module add(
    input a,b,cin,
    output cout,sum
);
    assign {cout,sum} = a+b+cin;
endmodule