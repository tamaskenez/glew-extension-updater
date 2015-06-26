#!/bin/bash
set -ex 

./init.sh $1 $2
./update.sh
./push.sh
