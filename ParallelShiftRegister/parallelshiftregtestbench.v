module parallelshiftregtestbench();
reg clk=0;
reg L;
reg Sh;
reg SI;
reg [3:0] D=4'b1011;
wire [3:0] Q;

parallelshiftreg uut(
clk,L,Sh,SI,D,Q
);

always @(posedge clk)
    clk = !clk;

initial
begin
    D = 4'b1101; Sh = 0; L = 1; SI = 0; #5;
    Sh = 1; L = 0; #5;
    D = 4'b0011; Sh = 0; L = 1; #5;
    Sh = 1; L = 0; SI = 1; #5;
    SI = 0; #5;
end
endmodule
