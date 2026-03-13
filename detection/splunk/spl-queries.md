# Splunk Detection Queries

This document lists the basic Splunk searches used to detect suspicious activities generated in the SOC lab.

The queries focus on identifying abnormal HTTP behavior and possible brute-force login attempts.

---

## 1. Detect Suspicious HTTP Requests (SQL Injection Patterns)

Search for common SQL injection patterns in web server logs.


index=apache_logs
| search uri_query="UNION" OR uri_query="SELECT" OR uri_query="*' OR *"
| table _time src_ip uri status user_agent


Purpose:

- Identify suspicious HTTP requests containing SQL keywords
- Detect potential SQL injection attempts

---

## 2. Identify Repeated Login Attempts (Brute Force)

Detect multiple authentication attempts from the same IP address.


index=apache_logs
uri="/dvwa/login.php"
| stats count by src_ip
| where count > 10


Purpose:

- Detect repeated login attempts
- Identify potential brute-force activity

---

## 3. Detect High Request Volume From Single IP

Search for abnormal traffic patterns targeting the web server.


index=apache_logs
| stats count by src_ip
| sort -count


Purpose:

- Identify sources generating excessive traffic
- Detect scanning or automated attack activity

---

## 4. Correlate IDS Alerts With Web Logs

Correlate IDS alerts with related HTTP requests.


index=snort OR index=apache_logs
| transaction src_ip maxspan=5m
| table _time src_ip signature uri


Purpose:

- Link IDS alerts with application logs
- Support incident investigation

---

These queries demonstrate basic SOC monitoring and log investigation