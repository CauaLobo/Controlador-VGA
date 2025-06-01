module comparador_igual_799 (
    input [9:0] hCount,
    output fim_h
);
    wire [9:0] constante_799 = 10'd799;
    wire [9:0] xnor_result;
    
    // Comparação bit a bit usando XNOR
    genvar i;
    generate
        for (i = 0; i < 10; i = i + 1) begin : xnor_loop
            xnor (xnor_result[i], hCount[i], constante_799[i]);
        end
    endgenerate
    
    // AND de todos os bits do resultado do XNOR
    and (fim_h, xnor_result[0], xnor_result[1], xnor_result[2], xnor_result[3],
                xnor_result[4], xnor_result[5], xnor_result[6], xnor_result[7],
                xnor_result[8], xnor_result[9]);
endmodule