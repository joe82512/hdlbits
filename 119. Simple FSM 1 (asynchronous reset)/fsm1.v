module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=1'b0, B=1'b1; 
    reg state, next_state;
    
    // step 1 狀態轉移
    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        state <= (areset) ? B:next_state ;
    end
    // step 2 轉移條件
    always @(*) begin    // This is a combinational always block
        // State transition logic
        case (state)
            B: next_state = (in==1'b1) ? B:A;
            A: next_state = (in==1'b1) ? A:B;
        endcase
    end
    // step 3 輸出; 建議用時序邏輯, 用組合邏輯容易產生毛刺
    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        //out <= (areset || next_state==B) ? 1'b1:'b0;
        if (areset)
            out <= 1'b1;
        else if (next_state==B)
            out <= 1'b1;
        else
            out <= 1'b0;
    end
    // Output logic
    //assign out = (state == B);

endmodule
