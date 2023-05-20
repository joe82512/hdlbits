module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter LEFT=3'b000, RIGHT=3'b001, groundL=3'b010, groundR=3'b011, digL=3'b100, digR=3'b101;
    reg [2:0] state, next_state;
    
	// State flip-flops with asynchronous reset
    // step 1 狀態轉移
    always @(posedge clk, posedge areset) begin
        state <= (areset) ? LEFT:next_state ;
    end
    
    // State transition logic
    // step 2 轉移條件
    always @(*) begin
        case (state)
            LEFT: begin
                if (!ground)
                    next_state = groundL;
                else if (ground && dig)
                    next_state = digL;
                else if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            RIGHT: begin
                if (!ground)
                    next_state = groundR;
                else if (ground && dig)
                    next_state = digR;
                else if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            groundL: begin
                if (!ground)
                    next_state = groundL;
                else
                    next_state = LEFT;
            end
            groundR: begin
                if (!ground)
                    next_state = groundR;
                else
                    next_state = RIGHT;
            end
            digL: begin
                if (!ground)
                    next_state = groundL;
                else
                    next_state = digL;
            end
            digR: begin
                if (!ground)
                    next_state = groundR;
                else
                    next_state = digR;
            end
            default:
                next_state = LEFT;
        endcase
    end
    
    // Output logic
    // step 3 輸出; 建議用時序邏輯, 用組合邏輯容易產生毛刺
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            walk_left <= 1'b1;
            walk_right <= 1'b0;
            aaah <= 1'b0;
            digging <= 1'b0;
        end
        else begin
            case (next_state)
                LEFT: begin
                    walk_left <= 1'b1;
                    walk_right <= 1'b0;
                    aaah <= 1'b0;
                    digging <= 1'b0;
                end
                RIGHT: begin
                    walk_left <= 1'b0;
                    walk_right <= 1'b1;
                    aaah <= 1'b0;
                    digging <= 1'b0;
                end
                groundL: begin
                    walk_left <= 1'b0;
                    walk_right <= 1'b0;
                    aaah <= 1'b1;
                    digging <= 1'b0;
                end
                groundR: begin
                    walk_left <= 1'b0;
                    walk_right <= 1'b0;
                    aaah <= 1'b1;
                    digging <= 1'b0;
                end
                digL: begin
                    walk_left <= 1'b0;
                    walk_right <= 1'b0;
                    aaah <= 1'b0;
                    digging <= 1'b1;
                end
                digR: begin
                    walk_left <= 1'b0;
                    walk_right <= 1'b0;
                    aaah <= 1'b0;
                    digging <= 1'b1;
                end
                default: begin
                    walk_left <= 1'b1;
                    walk_right <= 1'b0;
                    aaah <= 1'b0;
                    digging <= 1'b0;
                end
            endcase
        end //else
    end //always
    
endmodule
