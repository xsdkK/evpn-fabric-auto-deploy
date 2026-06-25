#!/bin/bash

set -e

ip netns exec leaf1 ip link set l1h master br10
ip netns exec leaf2 ip link set l2h master br10

ip netns exec leaf1 ip link set l1h up
ip netns exec leaf2 ip link set l2h up

echo "Bridges connected to hosts"