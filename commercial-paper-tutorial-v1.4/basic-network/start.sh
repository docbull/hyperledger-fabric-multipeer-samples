#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -ev

# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1
export BYFN_CA1_PRIVATE_KEY=$(cd crypto-config/peerOrganizations/org1.example.com/ca && ls *_sk)

docker-compose -f docker-compose.yml down

PEER_TIME=$(date +%s%3N)
docker-compose -f docker-compose.yml up -d peer0.org1.example.com
PEER_END=$(date +%s%3N)
echo "It took $(($PEER_END - $PEER_TIME)) milliseconds..."

docker-compose -f docker-compose.yml up -d ca.example.com orderer.example.com couchdb0 peer1.org1.example.com couchdb1 peer2.org1.example.com couchdb2 peer3.org1.example.com couchdb3 peer4.org1.example.com couchdb4 peer5.org1.example.com couchdb5 peer6.org1.example.com couchdb6 peer7.org1.example.com couchdb7 peer8.org1.example.com couchdb8 peer9.org1.example.com couchdb9 peer10.org1.example.com couchdb10

#docker-compose -f docker-compose.yml up -d ca.example.com orderer.example.com peer0.org1.example.com couchdb0 peer1.org1.example.com couchdb1 peer2.org1.example.com couchdb2 peer3.org1.example.com couchdb3 peer4.org1.example.com couchdb4 peer5.org1.example.com couchdb5 peer6.org1.example.com couchdb6 peer7.org1.example.com couchdb7 peer8.org1.example.com couchdb8 peer9.org1.example.com couchdb9 peer10.org1.example.com couchdb10
docker ps -a

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel create -o orderer.example.com:7050 -c mychannel -f /etc/hyperledger/configtx/channel.tx

START_TIME=$(date +%s%3N)
# Join peer0.org1.example.com to the channel.
docker exec -e "CORE_PEER_ADDRESS=peer0.org1.example.com:7051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block
END_TIME=$(date +%s%3N)
echo "It took $(($END_TIME - $START_TIME)) milliseconds..."

docker exec -e "CORE_PEER_ADDRESS=peer1.org1.example.com:8051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer2.org1.example.com:9051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer3.org1.example.com:10051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer4.org1.example.com:11051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer5.org1.example.com:12051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer6.org1.example.com:13051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer7.org1.example.com:14051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer8.org1.example.com:15051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer9.org1.example.com:16051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer10.org1.example.com:17051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block
