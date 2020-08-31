#! /bin/bash
if [ "$1" == 'uninstall' ]; then
echo "Removing q..."
rm -r ~/.q
else
case $(ls -a ~) in
*.q*)
fcon="$(cat ~/.q/q.sh)"
tfcon="$(cat q.sh)"
if [ "$tfcon" == "$fcon" ]; then
echo "Q is already the newest version."
exit
else
echo "Q is installed, but not the newest version."
sleep 1s
echo "Reinstalling Q..."
rm -r ~/.q
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
echo -e "case \$(ls -a ~) in\n*.q*)\n. ~/.q/q.sh;;\n*)\n;;\nesac" >> ~/.bashrc
fi
echo "Running Q via .bashrc..."
. ~/.bashrc
. q.sh
fi
