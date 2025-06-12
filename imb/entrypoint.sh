#!/bin/bash
set -e

echo "[INFO] Executando entrypoint.sh"

KEYS_DIR="/home/itau/imb/Keys"

echo "[INFO] Criando diretório de chaves..."
mkdir -p "$KEYS_DIR"

if [ ! -f "$KEYS_DIR/private.pem" ]; then
  echo "[INFO] Gerando chave privada..."
  openssl genpkey -out "$KEYS_DIR/private.pem" -algorithm RSA -pkeyopt rsa_keygen_bits:2048
else
  echo "[INFO] Chave privada já existe, pulando geração."
fi

if [ ! -f "$KEYS_DIR/public.pem" ]; then
  echo "[INFO] Gerando chave pública..."
  openssl rsa -in "$KEYS_DIR/private.pem" -pubout -out "$KEYS_DIR/public.pem"
else
  echo "[INFO] Chave pública já existe, pulando geração."
fi

echo "[INFO] Executando aplicação com argumento: $@"
exec /home/itau/imb/imb "$@"
