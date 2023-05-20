module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=1'b0, RIGHT=1'b1;
    reg state, next_state;
    
	// State flip-flops with asynchronous reset
    // step 1 狀態轉移
    always @(posedge clk, posedge areset) begin
        state <= (areset) ? LEFT:next_state ;
    end
    
    // State transition logic
    // step 2 轉移條件
    always @(*) begin
        case (state)
            LEFT: next_state = (bump_left) ? RIGHT:LEFT;
            RIGHT: next_state = (bump_right) ? LEFT:RIGHT;
        endcase
    end
    
    // Output logic
    // step 3 輸出; 建議用時序邏輯, 用組合邏輯容易產生毛刺
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            walk_left <= 1'b1;
            walk_right <= 1'b0;
        end
        else if (next_state==LEFT) begin
            walk_left <= 1'b1;
            walk_right <= 1'b0;
        end
        else begin
            walk_left <= 1'b0;
            walk_right <= 1'b1;
        end
    end

endmodule
