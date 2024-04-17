module DflipFlop_tb();

reg D;
reg clk;
wire Q;


Dflip_flop tst(
.D(D),
.clk(clk),
.Q(Q)
);


always #5  clk = ~clk;

initial begin
clk = 0;
end


always #10 D = ~D;

initial begin 
  D = 0;
  end
  
  endmodule
  