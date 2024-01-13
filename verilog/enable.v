module enable(s,d);
input [1:0] s;
output [3:0] d;

and a1(d[0],~s[0],~s[1]);
and a2(d[1],s[0],~s[1]);
and a3(d[2],~s[0],s[1]);
and a4(d[3],s[0],s[1]);

endmodule