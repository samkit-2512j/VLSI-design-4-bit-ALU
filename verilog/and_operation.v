module and_operation(a,b,enable,block_out);
input [3:0] a;
input [3:0] b;
input enable;
output [3:0] block_out;
wire ena0,ena1,ena2,ena3,enb0,enb1,enb2,enb3;

and en1(ena0,enable,a[0]);
and en2(ena1,enable,a[1]);
and en3(ena2,enable,a[2]);
and en4(ena3,enable,a[3]);
and en5(enb0,enable,b[0]);
and en6(enb1,enable,b[1]);
and en7(enb2,enable,b[2]);
and en8(enb3,enable,b[3]);

and a1(block_out[0],ena0,enb0);
and a2(block_out[1],ena1,enb1);
and a3(block_out[2],ena2,enb2);
and a4(block_out[3],ena3,enb3);

endmodule