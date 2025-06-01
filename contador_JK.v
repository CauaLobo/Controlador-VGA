module contador_JK (
    input clk, rst,
    input enable,
    output [9:0] Q
);
    wire [9:0] carry;

    jk_ff_flipflop ff0 (
        .clk(clk), .rst(rst),
        .J(1'b1), .K(1'b1),
        .enable(enable),
        .Q(Q[0])
    );

    assign carry[0] = Q[0];

    genvar i;
    generate
        for (i = 1; i < 10; i = i+1) begin : contador
            wire carry_local = &Q[i-1:0];  // Todos os bits anteriores são 1
            jk_ff_flipflop ff (
                .clk(clk), .rst(rst),
                .J(carry_local), .K(carry_local),
                .enable(enable),
                .Q(Q[i])
            );
        end
    endgenerate
endmodule