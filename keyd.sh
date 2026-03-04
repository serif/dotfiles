#!/bin/bash

sudo ln -s "$(pwd)/resources/raven/etc/keyd" "/etc/"
mkdir ../etc
cd ../etc
git clone https://github.com/rvaiya/keyd --depth=1
cd keyd
make
# sudo make install
# sudo systemctl enable keyd
# sudo systemctl start keyd
cd ..

