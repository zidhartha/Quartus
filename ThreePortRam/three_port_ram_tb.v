module three_port_ram_tb;

  reg clk;
  reg [7:0] addr_a, addr_b, addr_wr;
  reg [31:0] data_in;
  reg we;
  wire [31:0] data_a, data_b;

  three_port_ram uut0 (
    .clk(clk),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .addr_wr(addr_wr),
    .data_in(data_in),
    .we(we),
    .data_a(data_a),
    .data_b(data_b)
  );

  initial begin
    clk = 0;
    repeat (100) begin // Run for 100 clock cycles
      #5 clk = ~clk;
  end 
  end
  
  
  // Test sequence
  initial begin
    addr_a = 0;
    addr_b = 0;
    addr_wr = 0;
    data_in = 0;
    we = 0;

    // Write to address 1
    #10
    addr_wr = 8'd1;
    data_in = 32'hA5A5A5A5;
    we = 1;
    #10;
    we = 0;

    // Test the write operation (with corrected data_in width)
    addr_wr = 8'd1;
    data_in = 32'hA5A5A5A5;
    we = 1;
    #10;
    we = 0;

    // Test read operation from port B
    addr_b = 8'd1;
    #10;
    $display("Read data_b: %h (Expected : A5A5A5A5)", data_b);

    // Test read operation from port A
    addr_a = 8'd1;
    #10;
    $display("Read data_a: %h (Expected : A5A5A5A5)", data_a);

    // Write to address 0
    addr_wr = 8'd0;
    data_in = 32'hFFFFFFFF;
    we = 1;
    #10;
    we = 0;

    // Test read from address 0
    addr_a = 8'd0;
    addr_b = 8'd0;
    #10;
    $display("Read data_a from 0: %h (Expected : FFFFFFFF)", data_a);
    $display("Read data_b from 0: %h (Expected : FFFFFFFF)", data_b);

    // End simulation
    #50;
    $finish;
  end

endmodule
