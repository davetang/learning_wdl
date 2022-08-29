#!/usr/bin/env bash

set -euo pipefail

ver=83
links=(
   java
   cromwell-${ver}.jar
   womtool-${ver}.jar
)

for link in ${links[@]}; do
   if [[ -L ${link} ]]; then
      >&2 echo symlink ${link} already exists
   else
      >&2 echo Creating ${link} symlink
      ln -s ../src/${link} .
   fi
done

>&2 echo Done
exit 0

