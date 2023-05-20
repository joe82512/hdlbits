module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    // 先製作 k-map
    assign out_sop = (c&d)|(~a&~b&c); //找1
    //assign out_pos = c & (~b|d) & (~a|d); //找0
    assign out_pos = ~( (~c|~d)&(a|b|~c) ); // 直接從 out_sop 轉 > 找1後反轉
endmodule