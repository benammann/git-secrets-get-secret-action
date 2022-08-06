#!/bin/sh -l
file="$1"
context="$2"
resource="$3"
name="$4"
decryptSecretName="$5"
decryptSecretValue="$6"
value=$(/git-secrets/bin/git-secrets get $resource $name -f $file -c $context --secret "$decryptSecretName"="$decryptSecretValue")
echo "::add-mask::$value"
echo "::set-output name=value::$value"