module jk_ff_flipflop (
    input clk, rst,
    input J, K,
    input enable,
    output reg Q
);
    always @(negedge clk) begin
        if (rst)
            Q <= 1'b0;
        else if (enable) begin
            case ({J, K})
                2'b00: Q <= Q;         // Mantém
                2'b01: Q <= 1'b0;      // Reset
                2'b10: Q <= 1'b1;      // Set
                2'b11: Q <= ~Q;        // Toggle
            endcase
        end
    end
endmodule