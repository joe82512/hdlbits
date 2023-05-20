module top_module (
    input d, 
    input ena,
    output q);

    assign q = (ena) ? d:q; //latch對時序危害大, 沒default值 ,且消耗大
endmodule