#! /bin/bash

mkdir ~/.q
cp * ~/.q
rm ~/.q/install.sh ~/.q/README.md
echo "Q installed..."
sleep 1s
echo ". ~/.q/q.sh" >> ~/.bashrc
echo "Running Q via .bashrc..."
. ~/.bashrc
