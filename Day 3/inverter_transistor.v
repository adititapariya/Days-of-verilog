module inverter_transistor(w, a);
input a;
output w;
nmos mn (w, 0, 0);
pmos mp (w, 1, a);
endmodule