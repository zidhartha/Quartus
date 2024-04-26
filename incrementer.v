module incrementer(input clock,input reset,input enable,output reg [29:0] count = 0);

always @(posedge clock or negedge reset) begin
  if(!reset) count <= 0;
  else if (enable) count <= count + 1;
  end
endmodule

 
 