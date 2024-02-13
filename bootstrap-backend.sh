#!/bin/bash
set -x

# names must match the names in providers.tf
RG_NAME="cd-teroidc-shared"
SA_NAME="gnzteroidc"
CONTAINER_NAME="tfstate"

# create a resource group
az group create -n $RG_NAME -l uksouth

# create a storage account for storing terraform state
az storage account create -n $SA_NAME -g $RG_NAME -l uksouth --sku Standard_LRS

KEY=$(az storage account keys list -g $RG_NAME -n $SA_NAME --query "[0].value" -o tsv)

az storage container create -n $CONTAINER_NAME --account-name $SA_NAME --account-key $KEY