#!/bin/bash
set -e

# Script description
echo "# Select phase and resource."

# Select xxx phase
echo "## Select xxx phase."
echo "  1) phase1 (xxx)"
echo "  2) phase2 (xxx)"
read -p "  > Select number (1-2): " PHASE_CHOICE
case $PHASE_CHOICE in
    "1")
        PHASE="phase1" ;;
    "2")
        PHASE="phase2" ;;
    *)
        echo "  Error: Invalid number is entered."
        exit 1 ;;
esac
echo

# Select Google Cloud resource
echo "## Select Google Cloud resource."
echo "  1) IAM Role / dev_role"
echo "  2) IAM Role / prd_role"
read -p "  > Select number (1-2): " RESOURCE_CHOICE
case $RESOURCE_CHOICE in
    "1")
        RESOURCE="IAM Role / dev_role" ;;
    "2")
        RESOURCE="IAM Role / prd_role" ;;
    *)
        echo "  Error: Invalid number is entered."
        exit 1 ;;
esac
echo

# Confirm phase and resource
echo "## Confirm phase and resource."
echo "  Phase   : ${PHASE}"
echo "  Resource: ${RESOURCE}"
read -p "  > Are these correct? (yes/no): " CONFIRM_CHOICE
case $CONFIRM_CHOICE in
    "yes")
        echo "  OK: phase and resource settings successful."
        echo "PHASE=\"${PHASE}\"" > ./log/phase_and_resource.txt
        echo "RESOURCE=\"${RESOURCE}\"" >> ./log/phase_and_resource.txt ;;
    *)
        echo "  Error: phase and resource settings failed."
        exit 1 ;;
esac
echo
