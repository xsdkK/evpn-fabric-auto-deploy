#!/bin/bash

set -e

ip netns exec host1 ip addr add 192.168.10.11/24 dev h1
ip netns exec host2 ip addr add 192.168.10.22/24 dev h2

ip netns exec host1 ip link set lo up
ip netns exec host2 ip link set lo up

ip netns exec host1 ip link set h1 up
ip netns exec host2 ip link set h2 up

echo "Hosts configured"