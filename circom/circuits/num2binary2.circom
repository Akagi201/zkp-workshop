pragma circom 2.1.4;

template Example () {
    signal input in;

    signal input b[4];
    
    var acc;
    for (var i = 0; i < 4; i++) {
      acc += b[i] * (2 ** i);
    }
    in === acc;
    
    for (var i = 0; i < 4; i++) {
      0 === b[i] * (b[i] - 1);
    }
}

component main { public [ b ] } = Example();

/* INPUT = {
    "in": "11",
    "b": [ "1", "1", "0", "1"]
} */
