module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    //assign out = a|(~b&c)|(b&~c&~d);
    assign out = a|(~b&c); //d in map ignore
endmodule