module tb_registerEIMemPCI();
reg s;
reg clk;
reg rst;
reg [31:0] dataIn;
reg [31:0] dataddrIn;
wire E;
wire[31:0] pcOut;
wire[31:0] IOut;
wire[31:0] mOut;

registerEIMemPCI uut0 (.clk(clk), .rst(rst), .s(s), .dataddrIn(dataddrIn), .dataIn(dataIn), .pcOut(pcOut), .IOut(IOut), .mOut(mOut), .E(E));

always begin clk = ~clk; #10; end

initial begin 
clk = 0;
rst = 0;
dataddrIn = 32'b0;
dataIn = 32'b0;
#10
rst = 1;
#10
rst = 0;
#10
s = 1;
dataIn = 69;
dataddrIn = 10;
#10
s = 0;
end 


endmodule 