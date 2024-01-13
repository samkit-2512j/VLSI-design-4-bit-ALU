module tb_andop;

reg [3:0] a;
reg [3:0] b;
wire [3:0] c;
and_operation andop(a,b,c);

initial begin
    // $dumpfile("compare.vcd");
    // $dumpvars(0,tb_comparator);
    $monitor("Time=%0t \n A3=%b A2=%b A1=%b A0=%b \n B3=%b B2=%b B1=%b B0=%b \n Output:%b%b%b%b ", $time, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], c[3],c[2],c[1],c[0]);
    
     a=4'b0000;b=4'b0000;
    #5 a=4'b0001;b=4'b1111;
    #5 a=4'b0010;b=4'b0010;
    #5 a=4'b0011;b=4'b0000;
    #5 a=4'b0100;b=4'b0000; 
    #5 a=4'b0101;b=4'b0000;
    #5 a=4'b0110;b=4'b0000;
    #5 a=4'b0111;b=4'b0000;
    #5 a=4'b1111;b=4'b1111;
    #5 a=4'b1010;b=4'b1001;
    $finish;
end

endmodule