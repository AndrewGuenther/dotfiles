#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Link dotfiles
for f in $DIR/link/*; do
   rm -rf ~/.${f##*/} 
   ln -s $f ~/.${f##*/}
done
