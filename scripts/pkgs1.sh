#!/bin/sh
# get the list of all the packages that are installled then pipe it into a wc to ocunt the number of lines and output that to show the total number of packages installed
pkgs="$(aptitude search '~i' |wc -l)"

echo " $pkgs" > ~/.config/installedpackages.txt #nf-oct-package
