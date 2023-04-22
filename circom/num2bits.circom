pragma circom 2.1.4;

template Num2Bits (n) {
    signal input in;

    signal output b[n];
    
    var acc;
    for (var i = 0; i < n; i++) {
      b[i] <-- (in \ 2 ** i) % 2;
      0 === b[i] * (b[i] - 1);
      acc += b[i] * (2 ** i);
    }
    in === acc;
}

template Main() {
  signal input in;
  signal output o;

  component n2b = Num2Bits(4);
  n2b.in <== in;
  o <== n2b.b[0];
}

component main = Main();

/* INPUT = {
    "in": "11"
} */
