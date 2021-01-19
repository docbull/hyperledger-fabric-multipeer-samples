# 🌒 🌓 🌔 🌕 🌖 🌗 🌘

# Hyperledger Fabric Multi Peer Samples
In this repository, you can test hyperledger fabric samples with multiple peers.   
If you want to test new peer join in running channel, you can use shell script for new peer join.   

## First Network
30 peers in org1 and 2 peers in org2 in first network sample.   
You can invoke transactions and see the results using cli container.   
If you want to see the peers' log, just type "docker logs peer0.org1.example.com" in your terminal.   
You can also add new peer in the running channel (i.e., mychannel) with docker-compose-new-peer.yaml file or just run new-peer-join.sh shellscript file.

## Commercial Paper tutorial
In commercial paper tutorial, you can actually see how hyperledger fabric work as an application.   
You can run this sample with 10 committing peers and a leader peer.     
It also provides new peer join to test peer bootstrap time.

## Used Version
    Hyperledger Fabric v1.4.8
    Docker 19.03.8

## References
    Hyperledger Fabric
     - https://github.com/hyperledger/fabric
     - https://github.com/hyperledger/fabric-samples
     - http://hyperledger-fabric.readthedocs.io/en/release-1.4/
    New Peer Join
     - https://wahabjawed.medium.com/extending-hyperledger-fabric-network-adding-a-new-peer-4f52f70a7217

### Dongguk Univ., INLab 🇰🇷
