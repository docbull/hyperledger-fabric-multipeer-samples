#!/bin/bash

# Dongguk Univ, Gyeon-ju Campus., INLab

# shell script for invoking issue transactions

INVOKING_NUM="$1"
LOOP_TIME=$(seq 1 ${INVOKING_NUM})

echo
echo "Invoking ${INVOKING_NUM} issue transactions"
echo

for cnt in $LOOP_TIME; do
    echo "Invoking ${cnt}th of ${INVOKING_NUM} transaction"
    node issue.js
    echo
done