module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

	reg [7:0] temp;
    always @ (posedge clk) begin
        temp <= in; //temp 跟 in 差一個clk
        pedge <= in & ~temp; //in為1 temp為0
    end
endmodule