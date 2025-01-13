# Service Analyzer Script

This Bash script analyzes specific services defined in a YAML file (`sample.yml`). It outputs detailed information about a specified service, including its name, port, protocol, and environment variables.

## Prerequisites

Ensure you have `yq` installed to parse YAML files. If not, you can install it using:

```bash
# For Linux
sudo apt-get install yq

# For MacOS
brew install yq
```

## Script Details

The script performs the following actions:

- Reads the content of `sample.yml` file.
- Prompts the user to enter the service name.
- Fetches and displays detailed information about the specified service, including:
  - Name
  - Port
  - Protocol
  - Environment Variables

## Example

Here's an example of how the script works:

```bash
Enter the service name to analyze:
service1

Detailed Report for service service1
-----------------------------------------
Name: service1
Port: 8080
Protocol: http 

Environment Variables:
Name: VAR1, Value: value1
Name: VAR2, Value: value2
```
