# SOC Detection & Incident Response Lab

## Overview

This lab simulates common web application attacks against a vulnerable web application environment and demonstrates how security monitoring tools detect and investigate these events.

The objective is to reproduce a simplified SOC workflow:

Attack Traffic → IDS Detection → SIEM Investigation → Incident Analysis  

## Lab Environment

Components used in this lab:

- Attacker VM: Kali Linux
- Web Server: DVWA running on Ubuntu (Apache logs)
- Network Monitoring: Snort IDS
- SIEM Platform: Splunk
- Firewall: pfSense
- Traffic Analysis: Wireshark

## Simulated Attacks

The following attack scenarios were performed to generate security events:

- SQL Injection
- Brute-force login attempts
- Basic network scanning

These activities produce logs and alerts that can be analyzed by SOC monitoring tools.

## Quick Start

1. Generate attack traffic from the attacker VM.
2. Monitor IDS alerts produced by Snort.
3. Ingest logs into Splunk.
4. Investigate suspicious events using Splunk queries.

This lab demonstrates basic SOC Level 1 monitoring and investigation activities.
