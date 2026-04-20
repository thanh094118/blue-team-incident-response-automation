#!/usr/bin/env bashsdfsf
LOGFILE="${1:-/var/log/apache2/access.log}"
OUT_IOC="${2:-iocs.txt}"
TMP="/tmp/iocs.tmp"
asdad
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOGFILE" | sort -u > /tmp/ips.tmp
awk '{print $1 " " $4 " " $7}' "$LOGFILE" 2>/dev/null | awk '{print $1" "$3}' > /tmp/uri.tmp

grep -i -E "UNION|SELECT|OR 1=1|%27|\\' OR" "$LOGFILE" | awk '{print $1" "$7}' | sed 's/\"//g' > "$TMP"

printf "# IOC list generated: %s\n\n" "$(date -u)" > "$OUT_IOC"
printf "# suspicious_ips\n" >> "$OUT_IOC"
if [ -s /tmp/ips.tmp ]; then
  while read ip; do
    if [[ "$ip" =~ ^10\.|^172\.16\.|^192\.168\. ]]; then
      echo "ip:${ip}" >> "$OUT_IOC"
    else
      echo "ip:${ip}" >> "$OUT_IOC"
    fi
  done < /tmp/ips.tmp
fi

printf "\n# suspicious_uris\n" >> "$OUT_IOC"
if [ -s "$TMP" ]; then
  awk '{print $2}' "$TMP" | sort -u >> "$OUT_IOC"
fi

printf "\n# brute_force_candidates\n" >> "$OUT_IOC"
awk '/login/ {print $1}' /tmp/uri.tmp 2>/dev/null | sort | uniq -c | awk '$1>10 {print "ip:"$2" failed_attempts:"$1}' >> "$OUT_IOC"

rm -f /tmp/ips.tmp /tmp/uri.tmp "$TMP"
echo "IOCs written to $OUT_IOC"
