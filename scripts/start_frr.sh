#!/bin/bash

set -e

rm -rf runtime

mkdir -p runtime/{spine,leaf1,leaf2}

chown -R frr:frr runtime
chmod -R 755 runtime

FRR_DIR="/usr/libexec/frr"
BASE_DIR=$(pwd)

start_node(){
    NAME=$1

    echo "Starting FRR on $NAME..."

    ip netns exec $NAME \
    $FRR_DIR/zebra \
        -d \
        -f $BASE_DIR/configs/frr/$NAME.conf \
        -z $BASE_DIR/runtime/$NAME/zebra.sock \
        -i $BASE_DIR/runtime/$NAME/zebra.pid

    ip netns exec $NAME \
    $FRR_DIR/bgpd \
        -d \
        -f $BASE_DIR/configs/frr/$NAME.conf \
        -z $BASE_DIR/runtime/$NAME/zebra.sock \
        -i $BASE_DIR/runtime/$NAME/bgpd.pid
}

start_node spine
start_node leaf1
start_node leaf2

echo "FRR started on all nodes"