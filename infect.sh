#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

command -v apt-get && INSTALL="sudo apt-get install "
command -v yum && INSTALL="sudo yum -y install "

$INSTALL $(cat dependencies.list)

sudo chsh -s /bin/zsh $USER

git submodule init
git submodule update

# Create a directory to put old dotfiles
if [ -d ~/.olddots ]; then
   rm -rI ~/.olddots
fi
mkdir ~/.olddots

# Link dotfiles
for f in $DIR/link/*; do
   if [ -f ~/.${f##*/} ]; then
      cp ~/.${f##*/} ~/.olddots/.${f##*/}
   fi
   rm ~/.${f##*/}
   ln -s $f ~/.${f##*/}
done
