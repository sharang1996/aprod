#!/usr/bin/env bash

curl -v -d @'bad_params.json' -H 'Content-Type: application/json' \
     'http://127.0.0.1:8000'
echo
