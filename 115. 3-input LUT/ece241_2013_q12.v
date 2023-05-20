module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [7:0] temp;
    always @(posedge clk) begin
        if (enable)
            temp <= {temp[6:0],S};
        else
            temp <= temp;
    end
    
    assign Z = temp[{A,B,C}]; //{A,B,C}即位元位置
endmodule