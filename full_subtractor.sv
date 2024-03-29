module full_subtractor(
  input A,input B,input Bin,output Diff,output Borrow
  );
  
  assign Diff = A^B^Bin;
  assign Borrow = (~A & B) | ((~A | B) & Bin); 
  
  endmodule
  
  module fullsub_tb();
  reg A,B,Bin;
  wire Diff,Borrow;
  
  full_subtractor uut0(.A(A),.B(B),.Bin(Bin),.Diff(Diff),.Borrow(Borrow));
  
  initial begin
        A = 0; B = 0; Bin = 0;
        #10;
        A = 0; B = 0; Bin = 1;
        #10;
        A = 0; B = 1; Bin = 0;
        #10;
        A = 0; B = 1; Bin = 1;
        #10;
        A = 1; B = 0; Bin = 0;
        #10;
        A = 1; B = 0; Bin = 1;
        #10;
        A = 1; B = 1; Bin = 0;
        #10;
        A = 1; B = 1; Bin = 1;
        #10;
    end

endmodule 