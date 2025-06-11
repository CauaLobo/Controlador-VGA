module comparador_on_v (
    input [9:0] hCount,
    input [9:0] vCount,
    output on_v
);
    wire ge_35, lt_514;
    wire [9:0] diff_h, diff_v;
    wire borrow_h, borrow_v;
    
    // hCount >= 35
    subtrator_10bit sub_h (
        .A(hCount),
        .B(10'd35),
        .diff(diff_h),
        .borrow(borrow_h)
    );
    not (ge_35, borrow_h);
    
    // vCount < 514
    subtrator_10bit sub_v (
        .A(vCount),
        .B(10'd514),
        .diff(diff_v),
        .borrow(lt_514)
    );
    
    // on_v = ge_35 && lt_514
    and (on_v, ge_35, lt_514);
endmodule