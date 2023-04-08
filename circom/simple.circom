pragma circom 2.1.4;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template Example () {
    signal input x1;
    signal input x2;
    signal input x3;
    signal input x4;
    signal input y1;
    signal input y2;
    signal output out;
    
    y1 === x1 + x2;
    y2 === y1 * x3;
    out <== y2 - x4;
    // out <-- y2 - x4;
    // out === y2 - x4;
}

component main { public [ x1 ] } = Example();

/* INPUT = {
    "x1": "2",
    "x2": "4",
    "x3": "8",
    "x4": "5",
    "y1": "6",
    "y2": "48"
} */