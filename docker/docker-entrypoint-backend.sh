#!/bin/bash

set -e

if [ ! -d /data/validators ]; then
  ./target/release/exonum-cryptocurrency-multisig  generate-testnet 1 --output-dir /data
fi

exec "$@"
