module top_module (
    input clock,
    input a,
    output p,
    output q );
	
    always @(*) begin
        p = (clock) ? a : p;
    end
    
    always @(negedge clock) begin
        q <= p;
    end
endmodule