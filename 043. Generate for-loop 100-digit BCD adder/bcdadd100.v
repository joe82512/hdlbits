module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] temp;
    generate
        genvar i;
        for (i=0;i<100;i=i+1) begin: adder
            if (i==0) begin
                bcd_fadd inst1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(temp[0]), .sum(sum[3:0]));
            end
            else begin
                bcd_fadd inst2(.a(a[4*i+3:4*i]),
                               .b(b[4*i+3:4*i]),
                               .cin(temp[i-1]),
                               .cout(temp[i]),
                               .sum(sum[4*i+3:4*i]));
            end
        end
        assign cout = temp[99];
    endgenerate
endmodule