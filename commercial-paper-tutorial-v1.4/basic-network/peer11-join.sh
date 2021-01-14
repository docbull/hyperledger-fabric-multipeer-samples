#!/bin/bash

# Dongguk Univ, Gyeon-ju Campus., INLab
# REF) https://wahabjawed.medium.com/extending-hyperledger-fabric-network-adding-a-new-peer-4f52f70a7217

# shell script for invoking issue transactions

echo
echo "Extending maximum number of mychannel"
../bin/cryptogen extend --config=./crypto-config.yaml

echo 
echo "Creating new Peer #11 ..."
docker-compose -f docker-compose-new-peer.yaml up -d

echo
echo "New Peer #11 join in mychannel"
docker exec -e "CORE_PEER_ADDRESS=peer11.org1.example.com:18051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block
echo