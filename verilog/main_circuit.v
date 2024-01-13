module main_circuit(s,a,b,adder,subs,comp,and_op,d);
input [1:0] s;
input [3:0] a;
input [3:0] b;
output [4:0] adder;
output [4:0] subs;
output [2:0] comp;
output [3:0] and_op;
output [3:0] d;

enable en(s,d);

add_subs add1(a,b,1'b0,d[0],adder);
add_subs subs1(a,b,1'b1,d[1],subs);
comparator compare1(a,b,d[2],comp[1],comp[2],comp[0]);
and_operation and1(a,b,d[3],and_op);


endmodule