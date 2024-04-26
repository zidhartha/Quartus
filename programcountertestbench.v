module programcountertestbench();

reg clk=0;
reg reset=1;
reg [31:0] PCMAX=15;
wire [31:0] pc;

programcounter uut (
    clk, reset, PCMAX, pc
);

always begin
    #1; clk = !clk;
end

initial begin
    #40;
    reset = 0; #5;
    reset = 1; #5;
end

endmodule
