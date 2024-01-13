module add_subs(input [3:0] a,input [3:0] b,input m,input enable,output [4:0] sum);
wire [3:0] w;
wire w1,w2,w3;
wire ena0,ena1,ena2,ena3,enb0,enb1,enb2,enb3;

and en1(ena0,enable,a[0]);
and en2(ena1,enable,a[1]);
and en3(ena2,enable,a[2]);
and en4(ena3,enable,a[3]);
and en5(enb0,enable,b[0]);
and en6(enb1,enable,b[1]);
and en7(enb2,enable,b[2]);
and en8(enb3,enable,b[3]);

and enm(m1,enable,m);

xor x1(w[0],m1,enb0);
xor x2(w[1],m1,enb1);
xor x3(w[2],m1,enb2);
xor x4(w[3],m1,enb3);

fa f1(ena0,w[0],m1,sum[0],w1);
fa f2(ena1,w[1],w1,sum[1],w2);
fa f3(ena2,w[2],w2,sum[2],w3);
fa f4(ena3,w[3],w3,sum[3],sum[4]);

endmodule