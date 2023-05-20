// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    // 組合邏輯
    assign out_assign = a^b; //blocking 逐行執行
    always@(*) out_always_comb = a^b; //blocking 逐行執行
    // 時序邏輯
    always@(posedge clk) out_always_ff <= a^b; //non-blocking 同步執行
endmodule