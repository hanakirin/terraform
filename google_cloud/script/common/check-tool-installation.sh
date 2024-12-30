#!/bin/bash
set -e

# Script description
echo "# Check tool installation."

# Google Cloud SDK
echo "## Google Cloud SDK"
if command -v gcloud &> /dev/null; then
    echo "  OK: Installed."
else
    echo "  Error: Not installed."
    exit 1
fi
echo

# Terraform
echo "## Terraform"
if command -v terraform &> /dev/null; then
    echo "  OK: Installed."
else
    echo "  Error: Not installed."
    exit 1
fi
echo
