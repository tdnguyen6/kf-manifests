#!/usr/bin/env bash

DOMAIN=${1:-a.io}

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
OUT_DIR=$SCRIPT_DIR/../resources/tls

openssl req \
-x509 \
-newkey rsa:4096 \
-keyout "$OUT_DIR/tls.key" \
-out "$OUT_DIR/tls.crt" \
-days 365 \
-subj "/CN=$DOMAIN" \
-nodes # no password