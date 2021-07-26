#!/bin/sh

BASEDIR=$(dirname "$0")
MINERDIR="/home/artem/t-rex-0.20.3-linux"
cd ${BASEDIR}
./configurate_gpu.sh > config.log 2> config.err.log
cd ${MINERDIR}
./ETH-Binance.sh > ${BASEDIR}/mining.log
