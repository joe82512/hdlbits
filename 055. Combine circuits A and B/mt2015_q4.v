module top_module (input x, input y, output z);

    wire IA,IB;
    assign IA = (x^y)&x;
    assign IB = (x==y);
    assign z = (IA|IB)^(IA&IB);
endmodule
