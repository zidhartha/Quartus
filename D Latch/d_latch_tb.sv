module d_latch_tb;

reg D;
reg E;
wire Q;
d_latch uut0 (
    .D(D), 
    .E(E), 
    .Q(Q)
);
initial begin
    D = 0;
    E = 0;
    #20; 
    
    D = 1; #10;
    D = 0; #10;
    
    E = 1; #10;
    D = 1; #10;
    D = 0; #10;
    D = 1; #10;
    
    E = 0; #10;
    D = 0; #10;
    
    E = 1; #20; 
     
end
endmodule
