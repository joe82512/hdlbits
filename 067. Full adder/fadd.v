module top_module( 
    input a, b, cin,
    output cout, sum );

    //assign {cout, sum} = a+b+cin;
    assign sum = (a^b) ^ cin;
    assign cout = ((a^b)&cin) | (a&b);
endmodule