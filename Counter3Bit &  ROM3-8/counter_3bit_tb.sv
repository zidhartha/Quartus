module counter_3bit_tb;
    reg clk;
    reg reset;
    reg set;
    reg load;
    wire [2:0] count;

    counter_3bit counter1 (
        .clk(clk),
        .reset(reset),
        .set(set),
        .load(load),
        .count(count)
    );

    
    initial begin
    clk = 0;
    repeat (100) begin 
        #5;             
        clk = ~clk;     
    end
end
    initial begin
        #10;    
        reset = 1;
        #10;    
        reset = 0; 
        #10;    
        set = 1; 
        #10;    
        set = 0; 
        #10;    
        load = 1; 
        #10;    
        load = 0; 
        #100;   
    end
endmodule
