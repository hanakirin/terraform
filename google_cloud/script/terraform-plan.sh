#!/bin/bash

# Initialize script
source ./common/check-tool-installation.sh
source ./common/select-phase-and-resource.sh
source ./common/initialize-parameters.sh
source ./common/authenticate-google-cloud-user.sh
cd $GOOGLE_CLOUD_RESOURCE_DIRECTORY/env/$PHASE

# Script description
echo "# Run terraform."

# Run terraform init
echo "## Terraform init."
echo "  > Next, run [terraform init]. Please press any key."
read
terraform init
echo
echo "  OK: terraform init successful."
echo

# Run terraform plan
echo "## Terraform plan."
echo "  > Next, run [terraform plan -out=tfplan]. Please press any key."
read
terraform plan -out=tfplan
echo
echo "  OK: terraform plan successful."
echo "      Generate tfplan > [$(pwd)/tfplan]."
echo "      You can show plan [terraform show tfplan]."
echo
