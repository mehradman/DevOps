#!/bin/bash

# Store the content of sample.yml in a variable
sample_yml=$(cat sample.yml)

echo "Enter the service name to analyze:"
read service_name

echo "Detailed Report for service $service_name"
echo "-----------------------------------------"

echo "Name: $(echo "$sample_yml" | yq ".services[] | select(.name == \"$service_name\") | .name")"
echo "Port: $(echo "$sample_yml" | yq ".services[] | select(.name == \"$service_name\") | .port")"
echo -e "Protocol: $(echo "$sample_yml" | yq ".services[] | select(.name == \"$service_name\") | .protocol") \n"
echo "Environment Variables:"

env_length=$(echo "$sample_yml" | yq ".services[] | select(.name == \"$service_name\") | .env | length")

for (( i=0; i<$env_length; i++ )); do
   env_name=$(echo "$sample_yml" | yq ".services[] | select(.name == \"$service_name\") | .env[$i] | .NAME")
   env_value=$(echo "$sample_yml" | yq ".services[] | select(.name == \"$service_name\") | .env[$i] | .VALUE")
   echo "Name: $env_name, Value: $env_value"
done
