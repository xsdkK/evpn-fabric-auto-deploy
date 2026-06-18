#!/bin/bash

echo "Creating old namespaces..."

ip netns del leaf1 2>/dev/null || true
ip netns del leaf2 2>/dev/null || true
ip netns del spine 2>/dev/null || true

echo "Cleanup completed"