module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    parameter idle=0, F=1, x1=2, x2=3, keep_g1=4, G=5, y1=6, start=7, keep_g0=9;
    reg [3:0] state, next_state;
    
    always @(*) begin
        case (state)
            idle: next_state = F;
            F: next_state = start;
            start: next_state = (x) ? x1:start;
            x1: next_state = (!x) ? x2:x1;
            x2: next_state = (x) ? G:start;
            G: next_state = (y) ? keep_g1:y1;
            y1: next_state = (y) ? keep_g1:keep_g0;
            keep_g1: next_state = keep_g1;
            keep_g0: next_state = keep_g0;
        endcase
    end
    
    always @(posedge clk) begin
        state <= (!resetn) ? idle:next_state;
    end
    
    assign f = (state==F);
    assign g = (state==keep_g1) | (state==y1) | (state==G);
    
    //ref: https://blog.csdn.net/m0_46272475/article/details/121110450
    
endmodule
