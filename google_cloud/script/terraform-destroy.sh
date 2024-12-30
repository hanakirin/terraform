#!/bin/bash

# Initialize script
source ./common/check-tool-installation.sh
source ./common/select-phase-and-resource.sh
source ./common/initialize-parameters.sh
source ./common/authenticate-google-cloud-user.sh
cd $GOOGLE_CLOUD_RESOURCE_DIRECTORY/env/$PHASE

# Script description
echo "# Run terraform."

# Run terraform destroy
echo "## Terraform destroy."
echo "  > Next, run [terraform destroy]. Please press any key."
read
terraform destroy
echo
echo "  OK: terraform destroy successful."
