module tb_comparator;

reg [3:0] a;
reg [3:0] b;
reg enable;
wire eq,greater,lesser;

comparator compare(a,b,enable,eq,greater,lesser);

initial begin
    // $dumpfile("compare.vcd");
    // $dumpvars(0,tb_comparator);
    $monitor("Time=%0t \n A3=%b A2=%b A1=%b A0=%b \n B3=%b B2=%b B1=%b B0=%b \n equal=%b greater=%b lesser=%b ", $time, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], eq,greater,lesser);
    
     a=4'b0000;b=4'b0000;enable=1;
    #5 a=4'b0001;b=4'b1111;enable=1;
    #5 a=4'b0010;b=4'b0010;enable=1;
    #5 a=4'b0011;b=4'b0000;enable=1;
    #5 a=4'b0100;b=4'b0000;enable=1; 
    #5 a=4'b0101;b=4'b1100;enable=1;
    #5 a=4'b0110;b=4'b0000;enable=1;
    #5 a=4'b0111;b=4'b0000;enable=1;
    #5 a=4'b1000;b=4'b1000;enable=1;
    #5 a=4'b1000;b=4'b1000;enable=1;
    $finish;
end

endmodule