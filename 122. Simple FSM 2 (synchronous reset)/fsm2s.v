module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    // step 1 狀態轉移
    always @(posedge clk) begin
        state <= (reset) ? OFF:next_state ;
    end
    // step 2 轉移條件
    always @(*) begin
        case (state)
            OFF: next_state = (j==1'b1) ? ON:OFF;
            ON: next_state = (k==1'b1) ? OFF:ON;
        endcase
    end
    // step 3 輸出; 建議用時序邏輯, 用組合邏輯容易產生毛刺
    always @(posedge clk) begin
        if (reset)
            out <= 1'b0;
        else if (next_state==OFF)
            out <= 1'b0;
        else
            out <= 1'b1;
    end

endmodule
