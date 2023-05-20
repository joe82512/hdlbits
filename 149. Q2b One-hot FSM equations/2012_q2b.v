module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
	/*
    parameter A=6'b000001, B=6'b000010, C=6'b000100, D=6'b001000, E=6'b010000, F=6'b100000; //one-hot
    reg [5:0] next_state;
    
    assign next_state = {
        y[3]&w,
        y[2]&w | y[4]&w,
        y[1]&~w | y[2]&~w | y[4]&~w | y[5]&~w,
        y[1]&w | y[5]&w,
        y[0]&w,
        y[0]&~w | y[3]&~w
    };
    assign Y1=next_state[1];
    assign Y3=next_state[3];
    */
    parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5; //one-hot
    assign Y1 = y[A] & w;
    assign Y3 = (y[B] & ~w) | (y[C] & ~w) | (y[E] & ~w) | (y[F] & ~w);
    
endmodule
