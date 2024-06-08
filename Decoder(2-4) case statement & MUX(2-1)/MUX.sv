module MUX (
    input i1, i2, s,
    output reg o1
);

always @* begin
    if (s == 1) begin
        o1 = i1;
    end
    else begin
        o1 = i2;
    end
end
endmodule
module MUX_tb();

reg i1, i2, s;
wire o1;
MUX uut0 (.i1(i1),.i2(i2),.s(s),.o1(o1));
initial begin
    i1 = 0;
    i2 = 1;
    s = 1;
    #15;
    i1 = 1;
    i2 = 0;
    s = 1;
    #15;
    i1 = 1;
    i2 = 0;
    s = 0;
    #15;
    i1 = 0;
    i2 = 1;
    s = 0;
    #15;
end
endmodule 