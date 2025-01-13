#!/bin/bash

echo "Enter the service name to analyze:"
read service_name

echo "Detailed Report for service $service_name"
echo "-----------------------------------------"

echo "Name: $(yq ".services[] | select(.name == \"$service_name\") | .name" sample.yml)"
echo "Port: $(yq ".services[] | select(.name == \"$service_name\") | .port" sample.yml)"
echo -e "Protocol: $(yq ".services[] | select(.name == \"$service_name\") | .protocol" sample.yml) \n"
echo "Environment Variables:"

env_length=$(yq ".services[] | select(.name == \"$service_name\") | .env | length" sample.yml)

for (( i=0; i<$env_length; i++ )); do
   env_name=$(yq ".services[] | select(.name == \"$service_name\") | .env[$i] | .NAME" sample.yml)
   env_value=$(yq ".services[] | select(.name == \"$service_name\") | .env[$i] | .VALUE" sample.yml)
   echo "Name: $env_name, Value: $env_value"
done

#yq ".services[] | select(.name == \"$service_name\") | .env" sample.yml
