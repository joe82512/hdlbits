module top_module (input a, input b, input c, output out);//

    wire w; //fixed
    andgate inst1 (
        .out(w),
        .a(a),
        .b(b),
        .c(c),
        .d(1),
        .e(1)
    ); //fixed
	
    assign out = ~w;
    
endmodule