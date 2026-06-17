#!/bin/bash
set -e
echo "Create namespaces"

ip netns add spine1
ip netns add leaf1
ip netns add leaf2

echo "Namespace created"