#!/bin/bash

NUMBER1=10
NUMBER2=20

TIMESTAMP=$(date)
SUM=$(($NUMBER1+$NUMBER2))
echo "script executed at $TIMESTAMP"
echo "sum of $NUMBER1 and $NUMBER2 is $SUM"