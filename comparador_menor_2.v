module comparador_menor_2 (
    input [9:0] vCount,
    output vsync
);
    wire [9:0] diff;
    wire borrow;
    
    subtrator_10bit sub (
        .A(vCount),
        .B(10'd2),
        .diff(diff),
        .borrow(vsync)
    );
endmodule