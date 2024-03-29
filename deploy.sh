#!/bin/bash

# Usage: ./deploy.sh <environment>
# Example: ./deploy.sh dev

ENVIRONMENT=$1

# Set Databricks API URL based on environment
if [ "$ENVIRONMENT" == "dev" ]; then
    DATABRICKS_URL="https://adb-7800435272573232.12.azuredatabricks.net/browse/folders/workspace?o=7800435272573232"

else
    echo "Invalid environment. Supported environments: dev, prod"
    exit 1
fi

# Set the path to the notebook to be deployed
NOTEBOOK_PATH="/*"

# Set the name of the notebook in Databricks
NOTEBOOK_NAME="your_notebook_name"

# Set Databricks token (this should be securely stored and passed as a secret)
DATABRICKS_TOKEN=$DATABRICKS_TOKEN

# Use Databricks CLI to import the notebook
databricks workspace import -l /$NOTEBOOK_PATH -n $NOTEBOOK_NAME -t NOTEBOOK -o -i $NOTEBOOK_NAME.ipynb -a $DATABRICKS_URL -t $DATABRICKS_TOKEN

# Add any additional logic or steps needed for deployment

echo "Notebook deployed to $ENVIRONMENT environment successfully!"
