#!/bin/bash

# Load secret values from AWS Secrets Manager and save them to .env file

#Secrets Manager Secret ID
SECRET_ID="demo/app_key"
if [ -z "${SECRET_ID}" ]; then
    echo "\033[0;31mPlease set the SECRET_ID variable in the script.\033[0m"
    exit 1
fi
#AWS Region
REGION="ap-northeast-1"

secret_values=$(aws secretsmanager get-secret-value --secret-id "${SECRET_ID}" --region "${REGION}" | jq -r .SecretString)

if [ ! -f .env ]; then
    #cp .env.example .env
    touch .env
fi

echo "${secret_values}" | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" | while IFS= read -r line; do
    key=$(echo "$line" | cut -d '=' -f 1)
    value=$(echo "$line" | cut -d '=' -f 2-)
    if grep -q "^${key}=" .env; then
        ## Mac sed after option -i '' is required
        #sed -i '' "s#^${key}=.*#${key}=${value}#" .env
        sed -i "s#^${key}=.*#${key}=${value}#" .env
    else
        echo "${key}=${value}" >> .env
    fi
done

echo -e "\033[0;32mSecret values are successfully loaded to .env file.\033[0m"

