module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        q <= (reset || q == 9) ? 0 : q+1;
        /*
        if (reset)
            q <= 4'b0;
        else if (q==4'b1001) //4'd9
            q <= 4'b0;
        else
            q <= q + 1'b1;
        */
    end
endmodule