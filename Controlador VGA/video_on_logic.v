module video_on_logic (
    input on_h,
    input on_v,
    output video_on
);
    and (video_on, on_h, on_v);
endmodule