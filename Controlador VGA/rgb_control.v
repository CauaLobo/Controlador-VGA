module rgb_control(
	input a, b, c, d,
	output red0, red1, red2, red3,
	green0, green1, green2, green3, 
	blue0, blue1, blue2, blue3
	);

	
	// Fios negados
	
	wire na, nb, nc, nd;
			 
			not nota(na, a);
			not notb(nb, b);
			not notc(nc, c);
			not notd(nd, 	d);
			
	// Saída Vermelha

	wire ra0, ra1, ra2, ra3, ra4, ra5, ra6;
	 
		and a0 (ra0, a, c );
		and a1 (ra1, a, d);
		and a2 (ra2, a, b );
		and a3 (ra3, b, c);
		and a4 (ra4, b, d);
		and a5 (ra5, c, d);
		and a6 (ra6, na, nb, nc, nd);
		or (red3, ra0, ra1, ra2, ra3, ra4, ra5, ra6);

	wire rb0, rb1, rb2, rb3, rb4;

		and b0 (rb0, a, c, nd);
		and b1 (rb1, b, nc, d);
		and b2 (rb2, na, b, d);
		and b3 (rb3, nb, c, d);
		and b4 (rb4, nb, nc, nd);
		or (red2, rb0, rb1, rb2, rb3, rb4);

	wire rc0, rc1, rc2, rc3, rc4;

		and c0 (rc0, b, c, nd);
		and c1 (rc1, na, b, c);
		and c2 (rc2, b, nc, d);
		and c3 (rc3, nb, c, d);
		and c4 (rc4, nb, nc, nd);
		or (red1, rc0, rc1, rc2, rc3, rc4);

	wire rd0, rd1, rd2, rd3;

		and d0 (rd0, a, b, c);
		and d1 (rd1, b, nc, d);
		and d2 (rd2, nb, c, d);
		and d3 (rd3, nb, nc, nd);
		or (red0, rd0, rd1, rd2, rd3);

	wire ga0, ga1, ga2, ga3, ga4;
		
		and e0 (ga0, b, nd);
		and e1 (ga1, a, c, nd);
		and e2 (ga2, a, nc, d);
		and e3 (ga3, na, c, d);
		and e4 (ga4, na, b, nd);
		or (green3, ga0, ga1, ga2, ga3, ga4);

	wire gb0, gb1, gb2, gb3;
		
		and f0 (gb0, b, nc);
		and f1 (gb1, nb, d);
		and f2 (gb2, a, nb, d);
		and f3 (gb3, na, b, nd);
		or (green2, gb0, gb1, gb2, gb3);
	
	
	wire gc0, gc1, gc2, gc3;
		
		and g0 (gc0, na, b);
		and g1 (gc1, na, d);
		and g2 (gc2, a, c, nd);
		and g3 (gc3, nb, nc, d);
		or (green1, gc0, gc1, gc2, gc3);
	
	wire gd0, gd1, gd2, gd3;
		
		and h0 (gd0, nb, d);
		and h1 (gd1, na, d);
		and h2 (gd2, a, nb, c);
		and h3 (gd3, b, nc, nd);
		or (green0, gd0, gd1, gd2, gd3);
		
	wire ba0, ba1, ba2, ba3;
		
		and i0 (ba0, a, nb, nc);
		and i1 (ba1, b ,nc, nd);
		and i2 (ba2, na, c, nd);
		and i3 (ba3, a, b, c, d);
		or (blue3, ba0, ba1, ba2, ba3);
		
	wire bb0, bb1, bb2, bb3, bb4;
		
		and j0 (bb0, a, nb, nc);
 		and j1 (bb1, a, c, d);
		and j2 (bb2, b, nc, nd);
		and j3 (bb3, na, b, nc);
		and j4 (bb4, na, nb, c, nd);
		or (blue2, bb0, bb1, bb2, bb3, bb4);
		
	wire bc0, bc1, bc2, bc3;
		
		and k0 (bc0, b, nc);
		and k1 (bc1, a, b, d);
		and k2 (bc2, a, nc, nd);
		and k3 (bc3, na, c, nd,);
		or (blue1, bc0, bc1, bc2, bc3);
	
	wire bd0, bd1, bd2, bd3;
		
		and l0 (bd0, a, c, d);
		and l1 (bd1, a, nc, nd);
		and l2 (bd2, na, b, nc);
		and l3 (bd3, na, c, nd);
		or (blue0, bd0, bd1, bd2, bd3);

	
	endmodule
