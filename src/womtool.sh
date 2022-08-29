#!/usr/bin/env bash

set -euo pipefail

tool=womtool
ver=83
url=https://github.com/broadinstitute/cromwell/releases/download/${ver}/${tool}-${ver}.jar

if [[ -e ${tool}-${ver}.jar ]]; then
   >&2 echo ${tool}-${ver}.jar already exists
else
   wget -c ${url}
fi

>&2 echo Done
exit 0

