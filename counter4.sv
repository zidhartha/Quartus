module counter4 (
    input clk,input reset,output reg [3:0] count
);
always @(posedge clk or negedge reset) begin
    if (!reset)
        count <= 4'b0000;
    else
        count <= count + 1;
end
endmodule 

module counter_4bit_tb;

reg clk;
reg reset;
wire [3:0] count;

counter4 uut0 (
    .clk(clk),
    .reset(reset),
    .count(count)
);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10 reset = 0;
    #50 reset = 1;
    #10 reset = 0;
    #100 
	 $finish;
end

endmodule 