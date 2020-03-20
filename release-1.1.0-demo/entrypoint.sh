#!/bin/bash

set -u
set -x

echo "Launching Apache Atlas in standalone mode"
/bin/bash -c /atlas-distr/bin/atlas_start.py; tail -fF /atlas-distr/logs/application.log

