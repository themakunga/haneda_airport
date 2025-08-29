#!/usr/bin/env bash

# Script para obtener los hashes de feedr
REPO_URL="https://github.com/bahdotsh/feedr/archive/main.tar.gz"

# Hash del source
SOURCE_HASH=$(nix-prefetch-url --unpack "$REPO_URL")
echo "Source hash: $SOURCE_HASH"

# Hash de cargo (necesitas construir primero para obtenerlo)
echo "Para obtener cargoSha256:"
echo "1. Reemplaza temporalmente cargoSha256 con 'sha256-000...'"
echo "2. Ejecuta: nix-build -A feedr"
echo "3. Copia el hash real que muestra el error"
