module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (state[A]&~in)|(state[C]&~in);
    assign next_state[B] = (state[A]&in)|(state[B]&in)|(state[D]&in);
    assign next_state[C] = (state[B]&~in)|(state[D]&~in);
    assign next_state[D] = (state[C]&in);

    // Output logic: 
    assign out = state[D];
	// one-hot用於高速系統, 格雷碼則用於功耗低 ; 直接用assign, 不用Case
endmodule