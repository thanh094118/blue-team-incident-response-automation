# Data Sanitization Guidelines

Before publishing this repository, sensitive information must be removed from all files and screenshots.

## Remove Sensitive Data

Ensure the following data is not included:

- Real IP addresses
- Credentials or authentication tokens
- Private system usernames
- Internal network details

Replace sensitive values with example data such as:

192.168.x.x  
example_user  
example.com

## Log Sanitization

When sharing log files:

- Remove personal data
- Replace real hostnames
- Truncate unnecessary entries

Only include logs necessary to demonstrate detection and investigation.

## Screenshot Sanitization

Before uploading screenshots:

- Blur sensitive information
- Remove identifiable system details
- Avoid displaying real credentials

## PCAP Files

If sharing packet captures:

- Remove confidential payload data
- Only include packets required for demonstration
- Ensure traffic originates from a controlled lab environment

## Repository Safety

This repository is intended for educational and demonstration purposes only.

All activities were conducted in an isolated lab environment.