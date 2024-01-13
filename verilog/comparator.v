module comparator(a,b,enable,eq,greater,lesser);
input [3:0] a;
input [3:0] b;
input enable;
output eq,greater,lesser;
wire w0,w1,w2,w3,g0,g1,g2,g3,l0,l1,l2,l3;
wire ena0,ena1,ena2,ena3,enb0,enb1,enb2,enb3;

and en1(ena0,enable,a[0]);
and en2(ena1,enable,a[1]);
and en3(ena2,enable,a[2]);
and en4(ena3,enable,a[3]);
and en5(enb0,enable,b[0]);
and en6(enb1,enable,b[1]);
and en7(enb2,enable,b[2]);
and en8(enb3,enable,b[3]);

xnor x3(w3,ena3,enb3);
xnor x2(w2,ena2,enb2);
xnor x1(w1,ena1,enb1);
xnor x0(w0,ena0,enb0);

and ga3(g3,ena3,~enb3);
and ga2(g2,ena2,~enb2,w3);
and ga1(g1,ena1,~enb1,w3,w2);
and ga0(g0,ena0,~enb0,w3,w2,w1);

and la3(l3,~ena3,enb3);
and la2(l2,~ena2,enb2,w3);
and la1(l1,~ena1,enb1,w3,w2);
and la0(l0,~ena0,enb0,w3,w2,w1);

or g(greater,g3,g2,g1,g0);
and equal(eq,w3,w2,w1,w0,enable);
or l(lesser,l3,l2,l1,l0);


endmodule