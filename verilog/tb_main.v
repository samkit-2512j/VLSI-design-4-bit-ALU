module tb_main;

reg [1:0] s;
reg [3:0] a;
reg [3:0] b;
wire [4:0] adder;
wire [4:0] subs;
wire [2:0] comp;
wire [3:0] and_op;
wire [3:0] d;

main_circuit alu(s,a,b,adder,subs,comp,and_op,d);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,tb_main);
    $monitor("Time=%0t \n s=%b d=%b \n A3=%b A2=%b A1=%b A0=%b \n B3=%b B2=%b B1=%b B0=%b \n Adder=%b Subtractor=%b \n Comparator: Greater=%b Equal=%b Lesser=%b \n And=%b ", $time,s,d, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], adder, subs, comp[2],comp[1],comp[0],and_op);
    
     a=4'b0000;b=4'b0000;s=2'b00;
    #5 a=4'b0001;b=4'b0000;s=2'b10;
    #5 a=4'b0010;b=4'b0001;s=2'b11;
    #5 a=4'b0011;b=4'b1001;s=2'b10;
    #5 a=4'b1101;b=4'b1101;s=2'b11;
    #5 a=4'b0101;b=4'b1100;s=2'b00;
    #5 a=4'b0110;b=4'b0001;s=2'b00;
    #5 a=4'b0111;b=4'b0001;s=2'b01;
    #5 a=4'b1000;b=4'b1000;s=2'b10;
    #5 a=4'b1000;b=4'b1000;s=2'b01;
    #5 a=4'b0001;b=4'b1000;s=2'b01;
    #5 $finish;
end

endmodule