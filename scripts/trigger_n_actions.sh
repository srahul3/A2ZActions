#!/bin/bash
echo "arg 1: $1"
echo "arg 2: $2"
echo "arg 3: $3"

count=$1
for i in $(seq $count); do
    echo "Triggering the workflow# $i"
    curl -i -L -X POST -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" -H "Authorization: Bearer $2" $3 -d '{"event_type":"aop-test-trigger","client_payload":{"unit":false,"integration":true}}'
done
