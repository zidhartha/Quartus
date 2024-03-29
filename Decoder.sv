module Decoder(
    input x, y,
    output reg [0:3] z
);
always @*
begin
    if (x == 1'b0 && y == 1'b0) begin
        z = 4'b0001;
    end
    else if (x == 1'b0 && y == 1'b1) begin
        z = 4'b0010;
    end
    else if (x == 1'b1 && y == 1'b0) begin
        z = 4'b0100;
    end
    else if (x == 1'b1 && y == 1'b1) begin
        z = 4'b1000;
    end
    else begin
        z = 4'bxxxx; 
		  end
end
endmodule 

module Decoder_tb();
reg x,y;
wire z;

Decoder uut0(.x(x),.y(y),.z(z));
initial begin
        x = 0; y = 0;
        #10;
        x = 0; y = 1;
        #10;
        x = 1; y = 0;
        #10;
        x = 1; y = 1;
        #10;
    end
endmodule	