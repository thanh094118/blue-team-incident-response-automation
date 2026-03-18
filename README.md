# SOC Monitoring Lab — Attack Detection & Incident Response

![Lab Architecture](diagram/architecture-network.png)

Simulating a full **Attack → Detection → Incident Response** pipeline to develop SOC L1/L2 skills using real security telemetry.  
<sub><i>Lab environment: Kali (attacker), pfSense (firewall), Ubuntu + DVWA (target), Snort (IDS), Splunk (SIEM)</i></sub>  
<sub><i>Attacks simulated against the vulnerable web application: <a href="https://github.com/digininja/DVWA">[DVWA]</a></i></sub>  
<sub><i>Attack scenarios based on common vulnerabilities from <a href="https://owasp.org/www-project-top-ten/">[OWASP Top 10]</a></i></sub>

## Skills & Technologies
**Security:** Web attack detection, IDS rule writing, SIEM correlation, incident triage  
**Networking:** TCP/IP, HTTP traffic analysis, firewall policy, syslog forwarding  
**Systems:** Linux server environment, Apache, pfSense  
**Tools:** Kali Linux, DVWA, Snort, Splunk, pfSense, Wireshark / tcpdump

## Attack Simulation
Attacks generated from **Kali Linux** against the vulnerable DVWA application:
- Network reconnaissance — port scanning to generate firewall log spikes and Snort scan alerts
- SQL Injection — malicious query strings on DVWA input parameters to trigger IDS signatures
- Brute-force login — repeated POST requests to authentication page to create failed login spikes

## SOC Monitoring
Security investigation workflow:
- Collect baseline with **tcpdump** and import into **Splunk** (`index=lab`)
- Analyze **Apache access/error logs** for suspicious URIs and HTTP status codes
- Monitor **Snort IDS alerts** (scan rules, web attack signatures)
- Forward **pfSense syslog** and correlate events in **Splunk SIEM**
- Triage alerts (L1), build timeline, extract pcap, determine impact (L2)
- Contain via pfSense block rule; tune Snort rules to reduce false positives


## Detected
- HTTP query parameters containing SQLi keywords (`UNION SELECT`)
- Repeated authentication failures from a single source IP (401 spike)
- IDS alerts triggered by web attack signatures
- Multi-port connection attempts in pfSense firewall logs
    
---
**Objective:** Understand how web attacks generate logs, IDS alerts, and SIEM telemetry within a full SOC monitoring and incident response pipeline.

![security-lab](https://img.shields.io/badge/type-security_lab-red)
![blue-team](https://img.shields.io/badge/focus-blue_team-blue)
![siem](https://img.shields.io/badge/tool-Splunk-orange)
![ids](https://img.shields.io/badge/IDS-Snort-green)
![firewall](https://img.shields.io/badge/firewall-pfSense-lightgrey)
![target](https://img.shields.io/badge/target-DVWA-purple)
