#!/bin/bash

pkill zebra
pkill bgpd

rm -rf runtime/*
mkdir -p runtime/{spine,leaf1,leaf2}

echo "FRR stopped"