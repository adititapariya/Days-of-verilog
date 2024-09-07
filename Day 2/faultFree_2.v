module faultFree_2 (K,  A,B,C,D,   G0,E0,J1);
                
	input   A,B,C,D,  G0,E0,J1;
	output  K;
				  
    wire E, EE0, G, GG0, GG0_b, J, JJ1; 
  
    assign G = C;
    assign E = ~(A & B);
	assign EE0 = E0 & E;
	assign GG0 = G0 & G;
	assign GG0_b = ~GG0;
	assign J = GG0_b | D;
	assign I = EE0 & C;
	assign JJ1 = J1 | J;
	assign K = ~(I | JJ1);
  
endmodule