#!/bin/bash

set -e
set -x

rm -rf output/*.data

# Single test
RUST_LOG=info cargo run --release -- -k 18 --function zkmain --output ./output --wasm wasm/program.wasm setup
RUST_LOG=info cargo run --release -- -k 18 --function zkmain --output ./output --wasm wasm/program.wasm single-prove --public 11:i64
RUST_LOG=info cargo run --release  -- -k 18 --function zkmain --output ./output --wasm wasm/program.wasm single-verify --proof output/zkwasm.0.transcript.data --instance output/zkwasm.0.instance.data
RUST_LOG=info cargo run --release -- -k 18 --function zkmain --output ./output --wasm wasm/program.wasm aggregate-prove --public 11:i64
RUST_LOG=info cargo run --release -- -k 18 --function zkmain --output ./output --wasm wasm/program.wasm aggregate-verify --proof output/aggregate-circuit.0.transcript.data  --instances output/aggregate-circuit.0.instance.data

# you git now 