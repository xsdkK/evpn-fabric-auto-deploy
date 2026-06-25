#/bin/bash

set -e

ip netns exec leaf1 ip link add br10 type bridge
ip netns exec leaf2 ip link add br10 type bridge

ip netns exec leaf1 ip link set br10 up
ip netns exec leaf2 ip link set br10 up

echo "Bridges created and set up"