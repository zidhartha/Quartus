module registerEIMemPCI(input clk,input rst,input [31:0] dataIn,input [31:0] dataddrIn,output reg E,output reg [31:0] pcOut,
output reg [31:0] IOut,
output reg [31:0] mOut
);

reg [31:0] pc;
reg [31:0] I;
reg [31:0] mem [255:0];
initial $readmem("C:\This pc\Downloads", mem);

initial begin 
E = 0;
pcOut = 32'b0;
IOut = 32'b0;
mOut = 32'b0;
end 

always @(posedge clk or posedge rst) begin 
case (rst)
0: E = ~E;
1: E = 0;
endcase 

if (rst) begin 
pc<= pc + 1;
pcOut = pc;
end 
end 
always @(posedge clk) begin 
if (E== 0) begin 
I = mem[pc[31:2]];
mOut = I;
IOut = I;
end 
else if (s) begin 
mem[dataddrIn[31:2]] = dataIn;
mOut = mem[dataddrIn[31:2]];
end 
end 
endmodule


