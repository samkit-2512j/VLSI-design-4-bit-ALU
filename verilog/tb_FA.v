module tb_FA;

reg [1:0] s;
wire [3:0] d;

enable en(s,d);

initial begin
    // $dumpfile("fadder.vcd");
    // $dumpvars(0,tb_FA);
    $monitor("Time=%0t \n s=%b Output=%b ", $time,s,d);
    
     s=2'b00;
    #5 s=2'b10;
    #5 s=2'b11;
    #5 s=2'b01;
    #5 s=2'b11;
    #5 s=2'b10;
    #5 s=2'b00;
    #5 s=2'b01;
    #5 s=2'b10;
    #5 s=2'b01;
    $finish;
end

endmodule