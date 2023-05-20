module top_module( 
    input a, b,
    output cout, sum );

    assign cout = a&b;
    assign sum = a^b;
    //assign {cout, sum} = a+b;
endmodule