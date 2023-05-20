module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    /* sol 1
    parameter A=6'b000001, B=6'b000010, C=6'b000100, D=6'b001000, E=6'b010000, F=6'b100000; //one-hot
    reg [6:1] next_state;
    // State transition logic (combinational)
    always @(*) begin
        case (y)
            A: next_state = w ? A:B;
            B: next_state = w ? D:C;
            C: next_state = w ? D:E;
            D: next_state = w ? A:F;
            E: next_state = w ? D:E;
            F: next_state = w ? D:C;
            default: next_state = A;
        endcase
    end
    
    
    
    // State flip-flops (sequential)
//    always @(posedge clk) begin
//        state <= (reset) ? A:next_state ;
//    end
    
    
    // Output logic
    assign Y2 = y[1] & ~w;
    assign Y4 = (y[2] & w) | (y[3] & w) | (y[5] & w) | (y[6] & w);
   */
    
    /* sol 2
    reg [6:1] next_state;
    assign next_state = {
        y[4]&~w,
        y[3]&~w | y[5]&~w,
        y[2]&w | y[3]&w | y[5]&w | y[6]&w,
        y[2]&~w | y[6]&~w,
        y[1]&~w,
        y[1]&w | y[4]&w
    };

    assign Y2 = next_state[2];
    assign Y4 = next_state[4];
    */
    
    // sol 3
    parameter A=3'd1, B=3'd2, C=3'd3, D=3'd4, E=3'd5, F=3'd6; //one-hot
    
    assign Y2 = y[A] & ~w;
    assign Y4 = (y[B] & w) | (y[C] & w) | (y[E] & w) | (y[F] & w);
    
endmodule
