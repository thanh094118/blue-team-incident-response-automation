# SOC Analyst Playbook (L1)

This document describes the basic triage process for investigating security alerts generated in this lab environment.

## Alert Types

Common alerts observed in this lab:

- Suspicious HTTP requests (possible SQL injection)
- Multiple login failures (possible brute-force attack)
- Network scanning activity

## Investigation Steps

### 1. Validate the Alert

Check the alert source:

- IDS alert from Snort
- Suspicious logs in Splunk

Confirm the following information:

- Source IP
- Target service
- Timestamp

### 2. Log Analysis

Search related events in Splunk.

Example investigation queries:

- Identify suspicious HTTP requests
- Detect repeated login attempts from the same IP
- Review Apache access logs

### 3. Correlate Events

Correlate IDS alerts with web server logs:

IDS Alert → HTTP Request → Application Behavior

This helps confirm whether the alert corresponds to real attack activity.

### 4. Determine Impact

Evaluate whether the activity resulted in:

- Successful authentication
- Database access
- Abnormal application behavior

### 5. Escalation

Escalate the incident if:

- Multiple attack attempts are detected
- Sensitive resources were accessed
- The attack persists over time

Prepare an incident summary for further investigation.