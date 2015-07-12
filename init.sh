#!/bin/bash
set -ex 

echo "User: $1"
echo "Psw: $2"

rm -rf glew
git clone https://$1:$2@github.com/tamaskenez/glew-with-extensions
cd glew-with-extensions
git remote add -t master upstream https://github.com/nigels-com/glew
