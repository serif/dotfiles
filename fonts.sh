#!/bin/bash

mkdir -p $HOME/.local/share/
ln -s "$(pwd)/fonts" $HOME/.local/share/
fc-cache -f -v

