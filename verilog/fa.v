module fa(input a,input b,input c,output sout,output cout);
    wire w1,w2,w3;
    xor x1(w1,a,b);
    and a1(w2,a,b);
    xor x2(sout,w1,c);
    and a2(w3,w1,c);
    or o1(cout,w3,w2);
endmodule