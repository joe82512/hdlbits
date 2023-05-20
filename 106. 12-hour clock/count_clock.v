module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    reg [3:0] hh10, hh1, mm10, mm1, ss10, ss1;
    wire hour_change, hour_reset, pm_change;
    // ss
    always @(posedge clk) begin
        if (reset | (ena&&ss1==9))
            ss1 <= 0;
        else if (ena)
            ss1 <= ss1 + 1;
    end
    always @(posedge clk) begin
        if (reset | (ena&&ss1==9&&ss10==5))
            ss10 <= 0;
        else if (ena && ss1==9)
            ss10 <= ss10 + 1;
    end
    // mm
    always @(posedge clk) begin
        if (reset | (ena&&ss1==9&&ss10==5&&mm1==9))
            mm1 <= 0;
        else if (ena && ss1==9 && ss10==5)
            mm1 <= mm1 + 1;
    end
    always @(posedge clk) begin
        if (reset | (ena&&ss1==9&&ss10==5&&mm1==9&&mm10==5))
            mm10 <= 0;
        else if (ena && ss1==9 && ss10==5 && mm1==9)
            mm10 <= mm10 + 1;
    end
    // hh
    assign hour_change = (ss1==9&&ss10==5&&mm1==9&&mm10==5&& hh1==9 && hh10==0);
    assign hour_reset = (ss1==9&&ss10==5&&mm1==9&&mm10==5&& hh1==2 && hh10==1);
    always @(posedge clk) begin
        if (reset)
            hh1 <= 2; //12
        else if (ena && hour_change)
            hh1 <= 0; //09~10
        else if (ena && hour_reset)
            hh1 <= 1; //12~01
        else if (ena && ss1==9 && ss10==5 && mm1==9 && mm10==5)
            hh1 <= hh1 + 1;
    end
    always @(posedge clk) begin
        if (reset)
            hh10 <= 1; //12
        else if (ena && hour_reset)
            hh10 <= 0; //12~01
        else if (ena && ss1==9 && ss10==5 && mm1==9 && mm10==5 && hh1==9)
            hh10 <= hh10 + 1;
    end
    // am.pm
    always @(posedge clk) begin
        if (reset)
            pm_change <= 0;
        else if (ena && ss1==9 && ss10==5 && mm1==9 && mm10==5 && hh1==1 && hh10==1)
            pm_change <= ~pm_change; //11:59:59
    end
    
    // assign
    assign hh = {hh10,hh1};
    assign mm = {mm10,mm1};
    assign ss = {ss10,ss1};
    assign pm = pm_change;
endmodule