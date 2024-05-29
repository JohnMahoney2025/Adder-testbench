module adder_exercise(
		      a,b,cin,sum,cout);
   
   input a,b,cin;
   output sum,cout;
   wire   x,y,z;
   half_add h1(.a(a),.b(b),.s(x),.c(y));
   half_add h2(.a(x),.b(cin),.s(sum),.c(z));
   or o1(cout,y,z);
endmodule // adder_exercise
module half_add(a,b,s,c);
   input a,b;
   output s,c;
   //xor x1(s,a,b);
   assign s = a^b;
   
   //and a1(c,a,b);
   assign c = a&b;
   
endmodule :half_add

module full_add_tb;
   reg a,b,cin;
   wire sum,cout;

   adder_exercise f1(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

   //initial begin $dumpfile("full_tb.vcd");$dumpvars(); end
   initial begin $recordfile("waves.trn");
	         $recordvars(); end

   initial begin a=1'b1; #4; a=1'b0;#10 $stop(); end
   initial begin b=1'b1; forever #2 b=~b;end
   initial begin cin=1'b1;forever #1 cin=~cin; #10 $stop();end

  // initial begin $monitor(" time=%0d A=%b B=%b Cin=%b Sum=%b Cout=%b", $time,a,b,cin,sum,cout);end
 endmodule : full_add_tb

