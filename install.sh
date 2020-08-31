#! /bin/bash
case $(ls -a ~) in
*.q*)
fcon="$(cat ~/.q/*)"
mkdir ~/.tmpq
cp * ~/.tmpq
rm ~/.tmpq/install.sh ~/.tmpq/README.md
tfcon="$(cat ~/.tmpq/*)"
if [ "$tfcon" == "$fcon" ]; then
echo "Q is already the newest version."
rm -r ~/.tmpq
exit
else
echo "Q is installed, but not the newest version."
sleep 1s
echo "Reinstalling Q..."
rm -r ~/.tmpq ~/.q
mkdir ~/.q
cp q.sh ~/.q
cp commands.log ~/.q
fi
;;
*)
mkdir ~/.q
cp * ~/.q
rm ~/.q/install.sh ~/.q/README.md
echo "Q installed."
;;
esac
sleep 1s
if grep -q ". ~/.q/q.sh" ~/.bashrc; then
echo "Q is already installed in bashrc"
else
echo ". ~/.q/q.sh" >> ~/.bashrc
fi
echo "Running Q via .bashrc..."
. ~/.bashrc
