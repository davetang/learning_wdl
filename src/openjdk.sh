#!/usr/bin/env bash
#
# OpenLogic provides and supports free distributions of OpenJDK 8
# see https://www.openlogic.com/openjdk-downloads
#

set -euo pipefail

# https://stackoverflow.com/questions/2937407/test-whether-a-glob-has-any-matches-in-bash/34195247#34195247
if compgen -G "openlogic-openjdk*" > /dev/null; then
   >&2 echo Directory openlogic-openjdk* already exists
else
   tarball=openlogic-openjdk-8u262-b10-linux-x64.tar.gz
   wget -c https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u262-b10/${tarball}
   tar xzf ${tarball}
   rm ${tarball}
fi

>&2 echo Done
exit 0

