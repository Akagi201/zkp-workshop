pragma circom 2.1.4;

template Example (n) {
    signal input in;

    signal input b[n];
    
    var acc;
    for (var i = 0; i < n; i++) {
      acc += b[i] * (2 ** i);
    }
    in === acc;
    
    for (var i = 0; i < n; i++) {
      0 === b[i] * (b[i] - 1);
    }
}

component main { public [ b ] } = Example(4);

/* INPUT = {
    "in": "11",
    "b": [ "1", "1", "0", "1"]
} */
