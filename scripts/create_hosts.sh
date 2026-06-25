#!/bin/bash

set -e

ip netns add host1
ip netns add host2

echo "Hosts created"