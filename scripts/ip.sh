#!/usr/bin/env bash

dir=/tmp/ssh-sockets
port=2000

ssh -M -S "$dir/ip-$port" -fNT -R $port:localhost:443 aio

