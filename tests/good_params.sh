#!/usr/bin/env bash

curl -v -d @'good_params.json' -H 'Content-Type: application/json' \
     'http://127.0.0.1:8000'
echo
