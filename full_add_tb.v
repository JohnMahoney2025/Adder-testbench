module full_add_tb;
   reg a,b,cin;
   wire sum,cout;

   adder_exercise f1(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

   //initial begin $dumpfile("full_tb.vcd");$dumpvars(); end
   initial begin $recordfile("waves.trn");
	         $recordvars(); end

   initial begin #1; a=1'b1; #4; a=1'b0;#10 $stop(); end
   initial begin #1; b=1'b1; forever #2 b=~b;end
   initial begin #1; cin=1'b1;forever #1 cin=~cin; #10 $stop();end

  // initial begin $monitor(" time=%0d A=%b B=%b Cin=%b Sum=%b Cout=%b", $time,a,b,cin,sum,cout);end
 endmodule : full_add_tb

