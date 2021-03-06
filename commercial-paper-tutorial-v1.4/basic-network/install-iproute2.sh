#!/bin/bash

# Dongguk Univ, Gyeon-ju Campus., INLab
# REF) https://wahabjawed.medium.com/extending-hyperledger-fabric-network-adding-a-new-peer-4f52f70a7217

# shell script for invoking issue transactions

echo
echo "network emulator"

SEQUENCE=$(seq 1 20)
for i in $SEQUENCE
do
    echo "peer${i}.org1.example.com"
    docker exec peer${i}.org1.example.com apt-get update
    docker exec peer${i}.org1.example.com apt-get install iproute2 -y
done