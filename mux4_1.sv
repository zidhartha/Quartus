module mux4_1(output reg[3:0] o,input[1:0] which);
wire[3:0] a,b,c,d;
decoder1 decode0(.a(2'b00),.data(a));
decoder1 decode1(.a(2'b01),.data(b));
decoder1 decode2(.a(2'b10),.data(c));
decoder1 decode3(.a(2'b11),.data(d));

always @(which) begin
   if(which == 2'b00)
	    o <= a;
	if(which == 2'b01)
	    o <= b; 
   if(which == 2'b10)
	    o <= c;
	if(which == 2'b11)
	    o <= d; 
		 end
		 endmodule
		 
module mux4_1_tb();

  wire [3:0] o;
  reg [1:0] which;

  mux4_1_tb m(
    .o(o),
    .which(which)
  );

  initial begin
    which = 2'b00;
    #10; 
    which = 2'b01;
    #10; 
    which = 2'b10;
    #10; 
    which = 2'b11;
    #10; 
  end
  endmodule
