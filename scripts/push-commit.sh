#!/usr/bin/env bash
# Pushes a small commit to a branch, to start a new import in Infrahub.
# Usage: scripts/push-commit.sh <branch>
set -euo pipefail
branch="${1:?usage: $0 <branch>}"
git fetch origin "$branch"
git checkout -B "$branch" "origin/$branch"
echo "! commit at $(date -u +%Y-%m-%dT%H:%M:%SZ)" >> templates/device_config.j2
git commit -am "Test commit on $branch"
git push origin "$branch"
