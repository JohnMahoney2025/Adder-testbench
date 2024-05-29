
module half_add(a,b,s,c);
   input a,b;
   output s,c;
   //xor x1(s,a,b);
   assign s = a^b;
   
   //and a1(c,a,b);
   assign c = a&b;
   
endmodule :half_add

