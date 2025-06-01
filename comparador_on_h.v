module comparador_on_h (
    input  [9:0] hCount, 
    input  [9:0] vCount, 
    output       on_h 
);

    wire ge_144;
    wire lt_784;
    wire [9:0] diff_h;
    wire [9:0] diff_v;
    wire borrow_h;  
    wire borrow_v;

    subtrator_10bit sub_h (
        .A(hCount),
        .B(10'd144), 
        .diff(diff_h),
        .borrow(borrow_h)  
    );
    not (ge_144, borrow_h); 

    
    subtrator_10bit sub_v (
        .A(vCount),   
        .B(10'd784),  
        .diff(diff_v), 
        .borrow(lt_784)    
    );

    and (on_h, ge_144, lt_784);

endmodule