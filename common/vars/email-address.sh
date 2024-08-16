#!/bin/bash
#
# Ask and load email address.
#
# Return: EMAIL_ADDRESS

set -euo pipefail

if [[ ! -v EMAIL_ADDRESS ]]; then
  read -p "[Ask] Enter email address: " TEMP_EMAIL_ADDRESS
  if [[ "${TEMP_EMAIL_ADDRESS}" =~ ^.+@.+\..+$ ]]; then
    declare EMAIL_ADDRESS="${TEMP_EMAIL_ADDRESS}"
  else
    echo "[ERROR] EMail-Address: invalid email address" >&2
    exit 1
  fi
fi
