#!/bin/bash
set -e

# Initialize script (for Debug)
if [ -z "${GOOGLE_CLOUD_PROJECT_ID}" ]; then
    if [ -n "$1" ]; then
        PHASE=$1
        source initialize-parameters.sh
    else
        echo "  Error: Phase is not entered."
        exit 1
    fi
fi

# Script description
echo "# Google Cloud authentication."

# Remove google cloud authentication file
GOOGLE_CLOUD_CREDENTIALS_FILE="$HOME/.config/gcloud/application_default_credentials.json"
if [ -e $GOOGLE_CLOUD_CREDENTIALS_FILE ]; then
    rm $GOOGLE_CLOUD_CREDENTIALS_FILE
fi

# Authenticate google cloud user
echo "## User authentication."
echo "  > Once web browser is open, login with your Google Cloud account. Please press any key."
read
gcloud auth application-default login &> ./log/user_authentication.txt
if [ -e $GOOGLE_CLOUD_CREDENTIALS_FILE ]; then
    echo "  OK: Authentication successful."
else
    echo "  Error: Authentication failed."
    exit 1
fi
echo

# Set google cloud quota project
echo "## Set quota project."
gcloud auth application-default set-quota-project ${GOOGLE_CLOUD_PROJECT_ID} &> ./log/set_quota_project.txt
echo "  OK: Set quota project successful."
echo
