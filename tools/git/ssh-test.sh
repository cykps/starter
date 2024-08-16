#!/bin/bash
#
# Test script for SSH connection to github.com

echo "[INFO] GitHub-SSH-Test: Testing SSH connection."

if [[ "$(ssh -o StrictHostKeyChecking=no -T git@github.com 2>&1)" =~ ^Hi\ .+\!\ You\'ve\ successfully\ authenticated,\ but\ GitHub\ does\ not\ provide\ shell\ access\.$ ]]; then
  echo "[INFO] GitHub-SSH-Test: SSH connection test is successful."
  exit 0
else
  echo "[ERROR] GitHub-SSH-Test: SSH connection test is failed." >&2
  exit 1
fi
