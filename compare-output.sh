#!/bin/sh -l
currentValue="$1"
expected="$2"

if [ "$currentValue" = "$expected" ]; then
    echo "Decoded Secret maches the expected secret"
    exit 0
else
    echo "The given value does not match the expected value"
    exit 1
fi