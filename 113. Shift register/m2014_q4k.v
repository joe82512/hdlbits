module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg [3:0] temp;
    always @(posedge clk) begin
		temp <= (resetn) ? {temp[2:0], in}:4'd0;
    end
    
    assign out = temp[3];
endmodule