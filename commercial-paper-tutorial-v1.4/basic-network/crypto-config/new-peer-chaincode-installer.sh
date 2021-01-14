#!/bin/bash

# Dongguk Univ, Gyeong-ju Campus., INLab

# shell script for smart contract installing and instantiating

echo 
echo "Installing smart contract ..."
export CORE_PEER_ADDRESS=peer11.org1.example.com:18051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node