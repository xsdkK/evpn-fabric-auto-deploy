#!/bin/bash

set -e

ip link add h1 type veth peer name l1h
ip link add h2 type veth peer name l2h

ip link set h1 netns host1
ip link set h2 netns host2

ip link set l1h netns leaf1
ip link set l2h netns leaf2

echo "Host interfaces connected to leafs"