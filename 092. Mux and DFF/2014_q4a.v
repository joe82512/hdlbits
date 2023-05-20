module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    always @(posedge clk) begin
        if (L)
            Q <= R;
        else
            Q <= (E) ? w:Q;
    end
endmodule