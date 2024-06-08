module rom3to8_tb();

  reg [2:0] address;
  reg sel;
  wire [7:0] data;
  
  rom3to8 uut0(
    .address(address),
    .sel(sel),
    .data(data)
  );

  initial begin
    address = 0;
    sel = 0;
    #10;
    sel = 1;
    #10;
    address = 0;
    #10;
    address = 1;
    #10;
    address = 2;
    #10;
    address = 3;
    #10;
    address = 4;
    #10;
    address = 5;
    #10;
    address = 6;
    #10;
    address = 7;
    #10;
    
  end

endmodule 