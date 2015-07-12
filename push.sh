#!/bin/bash
set -ex

cd glew-with-extensions

git push --tags origin
git push --all origin
#for i in master $(git tag -l); do
#    git push origin $i-ext -u
#done



