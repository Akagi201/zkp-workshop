// ring c format lib to dalek rust format
use base64::{engine::general_purpose, Engine};
use ed25519_dalek::{pkcs8::DecodePrivateKey, SigningKey};
use ring::{
  rand,
  signature::{self, KeyPair},
};

fn main() {
  let rng = rand::SystemRandom::new();
  let pkcs8_bytes = signature::Ed25519KeyPair::generate_pkcs8(&rng).unwrap();
  println!("private key: {:?}", pkcs8_bytes.as_ref());
  let encoded = general_purpose::STANDARD.encode(&pkcs8_bytes);

  println!("private key: {}", encoded);

  let decoded = general_purpose::STANDARD.decode(&encoded).unwrap();
  let private_key: SigningKey = SigningKey::from_pkcs8_der(&decoded).unwrap();
  println!("decoded private key: {:?}", private_key.as_bytes());
  let encoded = general_purpose::STANDARD.encode(&private_key.as_bytes());

  println!("decoded private key: {:?}", encoded);

  let key_pair = signature::Ed25519KeyPair::from_pkcs8(pkcs8_bytes.as_ref()).unwrap();
  let peer_public_key_bytes = key_pair.public_key().as_ref();

  let encoded = general_purpose::URL_SAFE.encode(peer_public_key_bytes);

  println!("public key: {}", encoded);
}
