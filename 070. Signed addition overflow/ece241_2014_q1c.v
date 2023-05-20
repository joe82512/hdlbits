module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    assign s = a+b;
    assign overflow = (a[7]&b[7]& ~s[7])|(~a[7] & ~b[7] & s[7]); //正負數, 最高為相同且總和不同

endmodule