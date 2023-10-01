pragma circom 2.1.4;

template A(){
   signal input in;
   signal output outA; 
   var i = 0; var out = 0;
   while (i < 3){
    out++; i++;
   }
   // will fail: Non quadratic constraints are not allowed!
  //  while (i < in){
  //   out++; i++;
  //  }
   outA <== out;
}

template B(){
 component a = A();
 a.in <== 3;
}

component main = B();