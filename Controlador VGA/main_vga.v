module main_vga (
	input clk_50, rst_o,
	input sw0, sw1, sw2, sw3,
	output hsync, vsync,
	output [3:0] R, G, B
);

	// Sinais internos

	wire [9:0] vCount, hCount;
	wire fim_h, fim_v, rst, video_on;
	wire clk;
	wire reset_h, reset_v;
	wire on_h, on_v;
	wire red0, red1, red2, red3;
   wire green0, green1, green2, green3;
   wire blue0, blue1, blue2, blue3;
	
	//inversor reset
	not not_o (rst, rst_o);
	
	//Geração de Clock
	divisor_clock2 div (
	.clk(clk_50),
	.reset(rst),
	.clk_out(clk)
	);
	
	
	//Contadores Horizontais e Verticais
	
	comparador_igual_799 comp_h (
        .hCount(hCount),
        .fim_h(fim_h)
		  ); 
		  
	comparador_igual_524 comp_v (
        .vCount(vCount),
        .fim_v(fim_v)
    );
	
	or or_1 (reset_h, rst, fim_h);
	or or_2 (reset_v, rst, fim_v);
	
	
	contador_JK cont_h (
        .clk(clk),
		  .rst(reset_h), 
		  .enable(1'b1), 
		  .Q(hCount)
    );
	 contador_JK cont_v (
        .clk(clk), 
		  .rst(reset_v), 
		  .enable(fim_h), 
		  .Q(vCount)
    );
	 
	 //Geração de Sinais de Sincronismo
	 
	 
	 	 
	 comparador_menor_96 comp_hsync (
        .hCount(hCount),
        .hsync(hsync)
    );
	 
	 comparador_menor_2 comp_vsync (
        .vCount(vCount),
        .vsync(vsync)
    );
	 
	 //Lógica de Vídeo Ativo
	 
	 
	 comparador_on_h comp_on_h (
        .hCount(hCount),
        .vCount(vCount),
        .on_h(on_h)
    );
    
  
    comparador_on_v comp_on_v (
        .hCount(hCount),
        .vCount(vCount),
        .on_v(on_v)
    );
    

    video_on_logic video_on_inst (
        .on_h(on_h),
        .on_v(on_v),
        .video_on(video_on)
    );
	 
	 //Controle de Cores RGB
	 
	 rgb_control rgb_inst (
        .a(sw0),
        .b(sw1),
        .c(sw2),
        .d(sw3),
        .red0(red0), .red1(red1), .red2(red2), .red3(red3),
        .green0(green0), .green1(green1), .green2(green2), .green3(green3),
        .blue0(blue0), .blue1(blue1), .blue2(blue2), .blue3(blue3)
    );
	 
	 // Saída das cores
	 
	 and (R[0], red0, video_on);
    and (R[1], red1, video_on);
    and (R[2], red2, video_on);
    and (R[3], red3, video_on);
    and (G[0], green0, video_on);
    and (G[1], green1, video_on);
    and (G[2], green2, video_on);
    and (G[3], green3, video_on);
    and (B[0], blue0, video_on);
    and (B[1], blue1, video_on);
    and (B[2], blue2, video_on);
    and (B[3], blue3, video_on);
	
endmodule