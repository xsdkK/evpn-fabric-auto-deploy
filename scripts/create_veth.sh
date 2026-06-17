#!/bin/bash

echo "Creating veth links..."

#leaf1 <-> spine
ip link add leaf1-eth1 type veth peer name spine-eth1

#leaf2 <-> spine
ip link add leaf2-eth1 type veth peer name spine-eth2

#Move interfaces into namespaces
ip link set leaf1-eth1 netns leaf1
ip link set spine-eth1 netns spine
ip link set leaf2-eth1 netns leaf2
ip link set spine-eth2 netns spine

echo "Links created"