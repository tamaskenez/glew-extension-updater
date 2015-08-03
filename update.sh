#!/bin/bash
set -ex 

cd glew-with-extensions

git fetch --all
git fetch -t upstream

git checkout -B master origin/master
rm -rf *
git reset --hard upstream/master
echo -e '\n!/include/GL/*\n!/src/*\n' >>.gitignore

# create the extensions
sed -i -- 's/git clone/git clone --depth 1/g' auto/Makefile
make extensions
git checkout auto/Makefile # restore makefile

# commit the new files to new tmp branch
git checkout -B tmp
git add --all
git commit -m "make extensions on $(date -R -u)"

# checkout existing master-ext track or create new here
git checkout -B master-ext origin/master-ext || git checkout -B master-ext master

# first merge ordinary commits then get the extensions
git merge -m "update from 'master'" master
git cherry-pick --strategy=recursive -Xtheirs tmp
git branch -D tmp

# create/update extension branches
for i in $(git tag -l); do
    git rev-parse -q --verify $i-ext >/dev/null && l=0 || l=1
    git rev-parse -q --verify origin/$i-ext >/dev/null && r=0 || r=1
    if [[ $l != 0 && $r != 0 ]]; then
        git checkout -b $i-ext
        rm -rf *
        git reset --hard $i
        echo -e '\n!/include/GL/*\n!/src/*\n' >>.gitignore
    else
        git checkout $i-ext
        rm -rf *
        git reset --hard $i-ext
    fi

    # create the extensions
    sed -i -- 's/git clone/git clone --depth 1/g' auto/Makefile
    make extensions
    git checkout auto/Makefile # restore makefile

    git add --all
    git commit -m "make extensions on $(date -R -u)"
done


