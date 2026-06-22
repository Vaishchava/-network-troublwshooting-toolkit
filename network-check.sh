#!/bin/bash

echo "================================="
echo " Network Troubleshooting Toolkit "
echo "================================="

DOMAIN=$1

if [ $# -eq 0 ]; then
    echo "Usage: ./network-check.sh <domain>"
    exit 1
fi

check_dns() {
    RESULT=$(dig "$DOMAIN" +short | head -n 1)

    if [ -n "$RESULT" ]; then
        echo -e "\n[OK] DNS Resolution"
        echo "IP: $RESULT"
    else
        echo -e "\n[FAIL] DNS Resolution"
        echo "No DNS record found"
    fi
}

check_connectivity() {
    ping -c 2 "$DOMAIN" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "\n[OK] Internet Connectivity"
    else
        echo -e "\n[FAIL] Internet Connectivity"
    fi
}

check_latency() {
    LATENCY=$(ping -c 4 "$DOMAIN" | grep rtt | awk '{print $4}' | cut -d '/' -f 2)

    echo -e "\n[OK] Latency: $LATENCY ms"
}

check_gateway() {
    GATEWAY=$(ip route | grep default | awk '{print $3}')

    if [ -n "$GATEWAY" ]; then
        echo -e "\n[OK] Default Gateway Found"
        echo "Gateway: $GATEWAY"
    else
        echo -e "\n[FAIL] Default Gateway Missing"
    fi
}

check_public_ip() {
    PUBLIC_IP=$(curl -s ifconfig.me)

    if [ -n "$PUBLIC_IP" ]; then
        echo -e "\n[OK] Public IP Found"
        echo "Public IP: $PUBLIC_IP"
    else
        echo -e "\n[FAIL] Unable to determine Public IP"
    fi
}

check_ports() {
    PORTS=$(ss -tulpn \
        | tail -n +2 \
        | awk '{print $5}' \
        | awk -F ':' '{print $NF}' \
        | sort -n \
        | uniq)

    echo -e "\n[OPEN PORTS]"
    echo "$PORTS"
}

main() {
    check_dns
    check_connectivity
    check_latency
    check_gateway
    check_public_ip
    check_ports
}

main
