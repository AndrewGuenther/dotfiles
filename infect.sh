#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

command -v apt-get && INSTALL="sudo apt-get install "
command -v yum && INSTALL="sudo yum install "

while read dep; do
   $INSTALL $dep
done < dependencies.list

git submodule init
git submodule update

# Link dotfiles
for f in $DIR/link/*; do
   rm -rf ~/.${f##*/} 
   ln -s $f ~/.${f##*/}
done
