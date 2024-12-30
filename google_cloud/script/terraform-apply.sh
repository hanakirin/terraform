#!/bin/bash

# Initialize script
CONFIG_FILE="./log/phase_and_resource.txt"
if [ -e $CONFIG_FILE ]; then
    source $CONFIG_FILE
    echo "# Confirm phase and resource."
    echo "  Phase   : ${PHASE}"
    echo "  Resource: ${RESOURCE}"
    read -p "  > Are these correct? (yes/no): " CONFIRM_CHOICE
    case $CONFIRM_CHOICE in
        "yes")
            echo "  OK: phase and resource settings successful."
            echo ;;
        *)
            echo "  Error: Please re-run [terraform-plan.sh]."
            rm $CONFIG_FILE
            exit 1 ;;
    esac
else
    echo "Error: Please run [terraform-plan.sh]."
    exit 1
fi
rm $CONFIG_FILE
source ./common/initialize-parameters.sh
cd $GOOGLE_CLOUD_RESOURCE_DIRECTORY/env/$PHASE

# Script description
echo "# Run terraform."

# Check tfplan exists
echo "## Check tfplan existence."
if [ -e "tfplan" ]; then
    echo "  OK: Exist."
else
    echo "  Error: tfplan does not exist. Please run [terraform-plan.sh]."
    exit 1
fi
echo

# Run terraform apply
echo "## Terraform apply."
echo "  > Next, run [terraform apply \"tfplan\"]. Please press any key."
read
terraform apply "tfplan"
echo
echo "  OK: terraform apply successful."
echo

# Remove tfplan
echo "## Remove tfplan."
rm "tfplan"
echo "  OK: Removed."
