module Register_tb;
// Parameters
parameter CLK_PERIOD = 10;
// Signals
reg clk , EN , rst , read , write ;
reg [7:0] selectW1 , selectR1 , selectR2 ;
reg [31:0] addr ;
wire [31:0] outA , outB ;
// Instantiate the module
Register dut (
. clk ( clk ) ,
. EN ( EN ) ,
. rst ( rst ) ,
. selectW1 ( selectW1 ) ,
. selectR1 ( selectR1 ) ,
. selectR2 ( selectR2 ) ,
. read ( read ) ,
. write ( write ) ,
. addr ( addr ) ,
. outA ( outA ) ,
. outB ( outB )
);
// Clock generation
always begin
#5;
clk = 0;
#5
clk = 1;
end
// Test stimulus
initial begin
EN = 0;
rst = 1;
selectW1 = 0;
selectR1 = 0;
selectR2 = 0;
read = 0;
write = 0;
addr = 0;
#50 rst = 0;
// Test scenario 1: Write operation
#10;
EN = 1;
selectW1 = 1; // Select register to write to
addr = 123; // Data to write
write = 1;
#10;
write = 0;

#10;
// Test scenario 2: Read operation
selectR1 = 1;
selectR2 = 2;
read = 1;
#10;
read = 0;
#10;
// Test scenario 3: Write and Read operation
selectW1 = 3;
addr = 456;
write = 1;
#10;
write = 0;
#10;
selectR1 = 3;
selectR2 = 1;
read = 1;
#10;
read = 0;
#10;
// Test Scenario 4: when we want to write in 0 register
#10;
EN = 1;
selectW1 = 0;
addr = 123;
write = 1;
#10;
write = 0;
#10;
selectR1 = 0;
read = 1;
#10
read = 0;
end
endmodule 