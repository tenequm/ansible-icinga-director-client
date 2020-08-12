#!/bin/bash
#
# Version 1.0

VARIABLE=`egrep -i '(MemTotal|MemFree|Buffers|Cached|Swap)' /proc/meminfo | awk '{print $2}' | tr "\n" ":"`
MEMTOTAL=`echo $VARIABLE | cut -f1 -d:`
MEMTOTAL_CALC=`echo "${MEMTOTAL} / 1024 / 1024" | bc -l | awk '{printf("%.2f\n", $1)}'`
MEMFREE=`echo $VARIABLE | cut -f2 -d:`
MEMFREE_CALC=`echo "${MEMFREE} / 1024 / 1024" | bc -l | awk '{printf("%.2f\n", $1)}'`
BUFFERS=`echo $VARIABLE | cut -f3 -d:`
BUFFERS_CALC=`echo "${BUFFERS} / 1024 / 1024" | bc -l | awk '{printf("%.2f\n", $1)}'`
CACHED=`echo $VARIABLE | cut -f4 -d:`
CACHED_CALC=`echo "${CACHED} / 1024 / 1024" | bc -l | awk '{printf("%.2f\n", $1)}'`
SWAPTOTAL=`echo $VARIABLE | cut -f6 -d:`
SWAPTOTAL_CALC=`echo "${SWAPTOTAL} / 1024 / 1024" | bc -l | awk '{printf("%.2f\n", $1)}'`
SWAPFREE=`echo $VARIABLE | cut -f7 -d:`
SWAPFREE_CALC=`echo "${SWAPFREE} / 1024 / 1024" | bc -l | awk '{printf("%.2f\n", $1)}'`
REAL=`echo "((($MEMTOTAL_CALC - $MEMFREE_CALC) - $BUFFERS_CALC) - $CACHED_CALC)" | bc`
SWAP=`echo "$SWAPTOTAL_CALC - $SWAPFREE_CALC" | bc`
TOTAL=`echo "$MEMFREE_CALC + $BUFFERS_CALC + $CACHED_CALC + $REAL + $SWAP" | bc`


echo "OK|MemFree=$MEMFREE_CALC Buffers=$BUFFERS_CALC Cached=$CACHED_CALC Real=$REAL Swap=$SWAP Total=$TOTAL"
