#!/bin/bash

echo "Configuring IP addresses..."

#leaf1 <-> spine
ip netns exec leaf1 \
    ip addr add 10.0.0.1/24 dev leaf1-eth1

ip netns exec spine \
    ip addr add 10.0.0.254/24 dev spine-eth1

#leaf2 <-> spine
ip netns exec leaf2 \
    ip addr add 10.0.1.1/24 dev leaf2-eth1

ip netns exec spine \
    ip addr add 10.0.1.254/24 dev spine-eth2

#Bring up loopback
for ns in spine leaf1 leaf2
do
    ip netns exec $ns ip link set lo up
done

# Bring up the interfaces
ip netns exec leaf1 \
    ip link set leaf1-eth1 up

ip netns exec spine \
    ip link set spine-eth1 up

ip netns exec spine \
    ip link set spine-eth2 up

ip netns exec leaf2 \
    ip link set leaf2-eth1 up

echo "IP addresses configured"