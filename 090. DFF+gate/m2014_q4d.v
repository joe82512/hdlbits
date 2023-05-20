module top_module (
    input clk,
    input in, 
    output out);

    always @(posedge clk) begin
        out <= in^out; //out 為 reg
    end
endmodule