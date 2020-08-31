#! /bin/bash

mkdir ~/.q
cp * ~/.q
rm ~/.q/install.sh ~/.q/README.md
echo ". ~/.q/q.sh" >> ~/.bashrc
. ~/.bashrc
