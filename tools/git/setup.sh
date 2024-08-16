#!/bin/bash
#
# Setup script for Git with ed25519 SSH key

set -euo pipefail

if [[ ! -v REPO_ROOT ]]; then
  declare SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"
  declare REPO_ROOT="$(dirname "$(dirname "${SCRIPT_DIR}")")"
fi

echo "[INFO] Git-Setup: Start"

declare SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"


if [[ ! -f "$SSH_KEY_PATH" ]]; then
  source "$REPO_ROOT/common/vars/email-address.sh"
  ssh-keygen -t ed25519 -C "${EMAIL_ADDRESS}" -f "${SSH_KEY_PATH}" -N ""
fi

echo "[INFO] Git-Setup: Add this SSH key to your GitHub account."
echo "#### BEGIN SSH PUBRIC KEY ####"
cat "${SSH_KEY_PATH}.pub"
echo "#### END SSH PUBRIC KEY ####"

source "${REPO_ROOT}/common/wait-enter.sh"

source "${REPO_ROOT}/tools/git/ssh-test.sh"

echo "[INFO] Git-Setup: Completed"
