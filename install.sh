#! /bin/bash

mkdir ~/.q
cp * ~/.q
rm ~/.q/install.sh
echo ". ~/.q/q.sh" >> ~/.bashrc
. ~/.bashrc
