module MIPS_tb;
    reg clk, reset;
    
    MIPS mips (.clk(clk), .reset(reset));
    
    always begin
    #5 clk = ~clk;
    end

    
    initial begin 
        reset = 1;
        #10 reset = 0;
        
        #1000;
        
        $stop;
    end
endmodule 