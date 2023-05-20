module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3;
    reg [1:0] state, next_state;

    // State transition logic (combinational)
	always @(*) begin
        case (state)
            A: begin
                casez(r) //casez!
                    3'b000: next_state = A;
                    3'b100: next_state = D;
                    3'bz10: next_state = C;
                    3'bzz1: next_state = B;
                    default: next_state = A;
                endcase
            end
            
            B: next_state = r[1] ? B:A;
            C: next_state = r[2] ? C:A;
            D: next_state = r[3] ? D:A;
            
            default: next_state = A;
        endcase
    end
    
    // State flip-flops (sequential)
    always @(posedge clk) begin
        state <= (resetn) ? next_state:A;
    end
    
    // Output logic
    assign g = {
        (state==D),
        (state==C),
        (state==B)
    };
    
endmodule
