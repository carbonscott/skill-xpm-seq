#!/bin/bash
# Site detection for xpm-seq skill.
# Sets XPM_SEQ_BIN with a facility-appropriate default: the directory holding
# the shared uv, so bin/xpm-seq never depends on a personal ~/.local/bin/uv.
# Can always be overridden by setting XPM_SEQ_BIN before sourcing.

if [ -d /sdf ]; then
    # S3DF (SLAC)
    export XPM_SEQ_BIN="${XPM_SEQ_BIN:-/sdf/group/lcls/ds/dm/apps/dev/bin}"
elif [ -d /lustre/orion ]; then
    # OLCF (Frontier)
    export XPM_SEQ_BIN="${XPM_SEQ_BIN:-/ccs/home/cwang31/.local/bin}"
fi

if [ -n "${XPM_SEQ_BIN:-}" ]; then
    export PATH="$XPM_SEQ_BIN:$PATH"
fi
