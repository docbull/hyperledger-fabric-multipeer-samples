#!/bin/bash

# Dongguk Univ, Gyeong-ju Campus., INLab

# shell script for smart contract installing and instantiating

echo
echo "Run cliMagnetoCorp docker container ..."
cd ./organization/magnetocorp/configuration/cli/
docker-compose -f docker-compose.yml up -d cliMagnetoCorp

echo 
echo "Installing smart contract ..."
cd ./organization/magnetocorp/configuration/cli/
docker exec cliMagnetoCorp peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node

echo
echo "Instantiating smart contarct ..."
cd ./organization/magnetocorp/configuration/cli/
docker exec cliMagnetoCorp peer chaincode instantiate -n papercontract -v 0 -l node -c '{"Args":["org.papernet.commercialpaper:instantiate"]}' -C mychannel -P "AND ('Org1MSP.member')"
echo