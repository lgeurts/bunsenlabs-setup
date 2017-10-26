#!/bin/bash

# Usage: ./update.sh [pattern]
#
# Specify [pattern] to update only repos that match the pattern.

repos=(

  airblade/vim-gitgutter
  #ap/vim-css-color
  #docunext/closetag.vim
  ervandew/supertab
  itchyny/lightline.vim
  #junegunn/fzf.vim
  #junegunn/goyo.vim
  #mileszs/ack.vim
  scrooloose/nerdcommenter
  scrooloose/nerdtree
  #sheerun/vim-polyglot
  terryma/vim-multiple-cursors
  tpope/vim-bundler
  #tpope/vim-commentary
  #tpope/vim-dispatch
  tpope/vim-endwise
  tpope/vim-fugitive
  #tpope/vim-pathogen
  tpope/vim-rails
  vim-ruby/vim-ruby
  #w0rp/ale
  wincent/command-t

)

set -e
dir=~/.vim/bundle

if [ -d $dir -a -z "$1" ]; then
  temp="$(mktemp -d -t bundleXXXXX)"
  echo "▲ Moving old bundle dir to $temp"
  mv "$dir" "$temp"
fi

mkdir -p $dir

for repo in ${repos[@]}; do
  if [ -n "$1" ]; then
    if ! (echo "$repo" | grep -i "$1" &>/dev/null) ; then
      continue
    fi
  fi
  plugin="$(basename $repo | sed -e 's/\.git$//')"
  [ "$plugin" = "vim-styled-jsx" ] && plugin="000-vim-styled-jsx" # https://goo.gl/tJVPja
  dest="$dir/$plugin"
  rm -rf $dest
  (
    git clone --depth=1 -q https://github.com/$repo $dest
    rm -rf $dest/.git
    echo "· Cloned $repo"
  ) &
done
wait
