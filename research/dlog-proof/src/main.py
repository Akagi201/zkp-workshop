import hashlib
import random
import argparse
import sys

def dlogProof(x, g, p):
    # Step 1: Compute y = g^x (mod p)
    y = pow(g, x, p)

    # Step 2: Choose a random value r
    r = random.randint(1, p-1)

    # Step 3: Compute c = H(g, y, r)
    hash_input = str(g) + str(y) + str(r)
    c = int(hashlib.sha256(hash_input.encode()).hexdigest(), 16) % p

    # Step 4: Compute z = r - cx (mod p-1)
    z = (r - c*x) % (p-1)

    # Step 5: Return the residue y and the proof pf = (c, z)
    return y, (c, z)

def verify(y, g, p, pf):
    # Step 1: Unpack the proof
    c, z = pf

    # Step 2: Compute v1 = g^z * y^c (mod p)
    v1 = (pow(g, z, p) * pow(y, c, p)) % p

    # Step 3: Compute v2 = g^r (mod p)
    v2 = pow(g, pf[1], p)

    # Step 4: Return True if v1 == v2, else False
    return v1 == v2

def parse_args():
    parser = argparse.ArgumentParser()
    args = parser.parse_args()
    return args

def main(args=None):
    x = 123
    g = 2
    p = 541
    # Generate the proof
    y, pf = dlogProof(x, g, p)

    # Verify the proof
    assert verify(y, g, p, pf) == True
    

if __name__ == "__main__":
    sys.exit(main(parse_args()))
