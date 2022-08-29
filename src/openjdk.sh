#!/usr/bin/env bash
#
# OpenJDK version 9 to 15 are available at https://jdk.java.net/archive/
# Visit the URL above to obtain the relevant download link
#

set -euo pipefail

# https://stackoverflow.com/questions/2937407/test-whether-a-glob-has-any-matches-in-bash/34195247#34195247
if compgen -G "jdk-*" > /dev/null; then
   >&2 echo jdk-* already exists
else
   tarball=openjdk-11.0.2_linux-x64_bin.tar.gz
   wget -c https://download.java.net/java/GA/jdk11/9/GPL/${tarball}
   tar xzf ${tarball}
   rm ${tarball}
fi

if [[ -L java ]]; then
   >&2 echo java symlink already exists
else
   >&2 echo Creating java symlink
   ln -s jdk-*/bin/java .
fi

>&2 echo Done
exit 0

