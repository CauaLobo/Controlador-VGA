module divisor_clock2 (
    input wire clk,        
    input wire reset,     
    output reg clk_out     
);

	always @(posedge clk or posedge reset) begin
		 if (reset)
			  clk_out <= 1'b0;
		 else
			  clk_out <= ~clk_out;  // inverte a cada ciclo de clock
end

endmodule
