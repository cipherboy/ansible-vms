ui = false

storage "raft" {
  path = "/opt/openbao/data"
}

listener "tcp" {
  address         = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8201"
  tls_disable     = true
}

seal "pkcs11" {
  lib = "/usr/lib64/pkcs11/pkcs11-spy.so"
  mechanism = 0x1087
  token_label = "OpenBaoUnsealToken"
  key_label = "openbao-unseal-key-aes"
  pin = "4321"
}

api_addr     = "http://127.0.0.1:8200"
cluster_addr = "http://127.0.0.1:8201"
