#!/bin/bash
if which equivs-build >/dev/null; then
  printf "How many .deb packages to create?\n # "
  read END
  START=1
  for (( c=$START; c<=$END; c++ ))
  do
    printf "Building package number $c\n"
    echo "Section: misc" > sourcefile
    echo "Priority: optional" >> sourcefile
    echo "Standards-Version: $c.0.0" >> sourcefile
    echo "Package: debiantest$c" >> sourcefile
    echo "Description: Hello world$c" >> sourcefile
    equivs-build sourcefile > /dev/null 2>&1
  done
printf "Done.\n"
else
    echo "equivs-build not found. Are you running this script on a Debian based OS?"
fi
