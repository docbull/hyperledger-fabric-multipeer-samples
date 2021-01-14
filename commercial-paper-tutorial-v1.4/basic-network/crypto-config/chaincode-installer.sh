#!/bin/bash

# Dongguk Univ, Gyeong-ju Campus., INLab

# shell script for smart contract installing and instantiating

echo 
echo "Installing smart contract ..."
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer1.org1.example.com:8051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer2.org1.example.com:9051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer3.org1.example.com:10051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer4.org1.example.com:11051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer5.org1.example.com:12051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer6.org1.example.com:13051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer7.org1.example.com:14051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer8.org1.example.com:15051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer9.org1.example.com:16051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node
export CORE_PEER_ADDRESS=peer10.org1.example.com:17051
peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node

echo
echo "Instantiating smart contarct ..."
peer chaincode instantiate -n papercontract -v 0 -l node -c '{"Args":["org.papernet.commercialpaper:instantiate"]}' -C mychannel -P "AND ('Org1MSP.member')"
echo