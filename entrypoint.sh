#!/bin/bash

set -e

echo "[INFO] Executando configuração automática do IMB..."

# Substitua pelas suas variáveis reais ou use variáveis de ambiente
IMB_USER="${IMB_USER:-usuario_padrao}"
IMB_PASS="${IMB_PASS:-senha_padrao}"

# Executa o autoconfig com credenciais
./imb config -privateKey ./Keys/id_rsa_itau
./imb autoconfig -user "$IMB_USER" -pwd "$IMB_PASS"

# Testa a conexão
echo "[INFO] Testando conexão com o Itaú..."
./imb start -test

# Inicia normalmente
echo "[INFO] Iniciando IMB em modo padrão..."
exec ./imb start
