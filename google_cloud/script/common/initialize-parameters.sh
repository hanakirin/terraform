#!/bin/bash
set -e

# Script description
echo "# Initialize parameters."

# Define google cloud project id
if [ -n "${PHASE}" ] && [ -z "${GOOGLE_CLOUD_PROJECT_ID}" ]; then
    case $PHASE in
        "phase1")
            readonly GOOGLE_CLOUD_PROJECT_ID="phase1" ;;
        "phase2")
            readonly GOOGLE_CLOUD_PROJECT_ID="phase2" ;;
        *)
            echo "  Error: Invalid phase is entered."
            exit 1 ;;
    esac
fi

# Define google cloud resource directory
if [ -n "${RESOURCE}" ] && [ -z "${GOOGLE_CLOUD_RESOURCE_DIRECTORY}" ]; then
    case $RESOURCE in
        "IAM Role / dev_role")
            readonly GOOGLE_CLOUD_RESOURCE_DIRECTORY="../iam_role/dev_role" ;;
        "IAM Role / prd_role")
            readonly GOOGLE_CLOUD_RESOURCE_DIRECTORY="../iam_role/prd_role" ;;
        *)
            echo "  Error: Invalid resource is entered."
            exit 1 ;;
    esac
fi

# Finish Script
echo "  OK: Initialization successful."
echo
