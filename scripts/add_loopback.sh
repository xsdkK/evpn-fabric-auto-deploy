#!/bin/bash

set -e

ip netns exec spine \
    ip addr add 1.1.1.1/32 dev lo

ip netns exec leaf1 \
    ip addr add 2.2.2.2/32 dev lo

ip netns exec leaf2 \
    ip addr add 3.3.3.3/32 dev lo

echo "Loopback addresses configured"