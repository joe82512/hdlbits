module top_module (
    input clk,
    input d,
    output q
);

    reg q_temp1, q_temp2;
    always @(posedge clk) begin
        q_temp1 <= d ^ q_temp2;
        // bad: q_temp1 <= d;
    end
    
    always @(negedge clk) begin
        q_temp2 <= d ^ q_temp1;
        // bad: q_temp2 <= d;
    end
    
    assign q = q_temp1 ^ q_temp2;
    // bad: assign q = (clk) ? q_temp1:q_temp2; //因glitch容易產生毛刺
endmodule