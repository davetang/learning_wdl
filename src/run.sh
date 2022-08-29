#!/usr/bin/env bash

set -euo pipefail

./cromwell.sh
./openjdk.sh
./womtool.sh
exit 0

