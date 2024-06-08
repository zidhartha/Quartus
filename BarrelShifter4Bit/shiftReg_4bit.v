module shiftReg_4bit(input clock, input signal, input reset, output reg [3:0] out=0);

always @(posedge clock) begin
    if (!reset) out <= 0;
    else begin
        out[3:1] <= out[2:0];
        out[0] <= signal;
    end
end
endmodule
