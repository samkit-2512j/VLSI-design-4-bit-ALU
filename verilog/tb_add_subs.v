module tb_add_subs;

reg [3:0] a;
reg [3:0] b;
reg enable;
reg m;
// wire c;
wire [4:0] sum;

add_subs adder(a,b,m,enable,sum);

initial begin
    // $dumpfile("adder.vcd");
    // $dumpvars(0,tb_add_subs);
    $monitor("Time=%0t \n A3=%b A2=%b A1=%b A0=%b \n B3=%b B2=%b B1=%b B0=%b \n m=%b enable=%b \n Output=%b ", $time, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], m,enable,sum);
    
     a=4'b0000;b=4'b0000;m=0;enable=0;
    #5 a=4'b0001;b=4'b0000;m=1;enable=1;
    #5 a=4'b0010;b=4'b0000;m=0;enable=0;
    #5 a=4'b0011;b=4'b0000;m=1;enable=1;
    #5 a=4'b0100;b=4'b0000;m=0;enable=1;
    #5 a=4'b0101;b=4'b0000;m=1;enable=1;
    #5 a=4'b0110;b=4'b0000;m=0;enable=1;
    #5 a=4'b0111;b=4'b0000;m=1;enable=0;
    #5 a=4'b1000;b=4'b1000;m=0;enable=0;
    #5 a=4'b1000;b=4'b1000;m=1;enable=1;
    $finish;
end

endmodule