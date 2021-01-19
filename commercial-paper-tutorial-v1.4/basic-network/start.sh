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

docker-compose -f docker-compose.yml up -d ca.example.com orderer.example.com couchdb0 peer1.org1.example.com couchdb1 peer2.org1.example.com couchdb2 peer3.org1.example.com couchdb3 peer4.org1.example.com couchdb4 peer5.org1.example.com couchdb5 peer6.org1.example.com couchdb6 peer7.org1.example.com couchdb7 peer8.org1.example.com couchdb8 peer9.org1.example.com couchdb9 peer10.org1.example.com couchdb10 peer11.org1.example.com couchdb11 peer12.org1.example.com couchdb12 peer13.org1.example.com couchdb13 peer14.org1.example.com couchdb14 peer15.org1.example.com couchdb15 peer16.org1.example.com couchdb16 peer17.org1.example.com couchdb17 peer18.org1.example.com couchdb18 peer19.org1.example.com couchdb19 peer20.org1.example.com couchdb20

#docker-compose -f docker-compose.yml up -d ca.example.com orderer.example.com peer0.org1.example.com couchdb0 peer1.org1.example.com couchdb1 peer2.org1.example.com couchdb2 peer3.org1.example.com couchdb3 peer4.org1.example.com couchdb4 peer5.org1.example.com couchdb5 peer6.org1.example.com couchdb6 peer7.org1.example.com couchdb7 peer8.org1.example.com couchdb8 peer9.org1.example.com couchdb9 peer10.org1.example.com couchdb10
docker ps -a

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=40
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

docker exec -e "CORE_PEER_ADDRESS=peer11.org1.example.com:17151" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer12.org1.example.com:17251" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer13.org1.example.com:17351" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer14.org1.example.com:17451" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer15.org1.example.com:17551" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer16.org1.example.com:17651" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer17.org1.example.com:17751" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer18.org1.example.com:17851" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer19.org1.example.com:17951" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ADDRESS=peer20.org1.example.com:18051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block
