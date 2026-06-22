# Network Troubleshooting Toolkit

A Bash-based networking diagnostic tool that helps troubleshoot common network issues on Linux systems.

## Features

### DNS Resolution Check

Verifies whether a domain can be resolved to an IP address.

**Command Used:**

```bash
dig <domain> +short
```

### Internet Connectivity Check

Tests network connectivity using ICMP ping.

**Command Used:**

```bash
ping -c 2 <domain>
```

### Latency Check

Measures average network latency to a target domain.

**Command Used:**

```bash
ping -c 4 <domain>
```

### Default Gateway Check

Detects the configured default gateway.

**Command Used:**

```bash
ip route
```

### Public IP Detection

Retrieves the system's public IP address.

**Command Used:**

```bash
curl -s ifconfig.me
```

### Open Ports Detection

Lists listening TCP and UDP ports on the local system.

**Command Used:**

```bash
ss -tulpn
```

---

# Technologies Used

* Bash Scripting
* Linux Networking Commands
* DNS
* TCP/IP
* ICMP
* Routing
* Process and Socket Inspection

---

# Project Structure

```text
network-troubleshooting-toolkit/
│
├── network-check.sh
├── README.md
├── screenshots/
│   └── output.png
└── sample-output.txt
```

---

# Installation

Clone the repository:

```bash
git clone https://github.com/vaishchava/network-troubleshooting-toolkit.git
```

Move into the project directory:

```bash
cd network-troubleshooting-toolkit
```

Make the script executable:

```bash
chmod +x network-check.sh
```

---

# Usage

Run the script and provide a domain name:

```bash
./network-check.sh google.com
```

Example:

```bash
./network-check.sh github.com
```

---

# Sample Output

```text
=================================
 Network Troubleshooting Toolkit
=================================

[OK] DNS Resolution
IP: 142.250.183.14

[OK] Internet Connectivity

[OK] Latency: 12.4 ms

[OK] Default Gateway Found
Gateway: 192.168.1.1

[OK] Public IP Found
Public IP: 49.xx.xx.xx

[OPEN PORTS]
22
53
80
443
323
```

---

# Networking Concepts Learned

Through this project, I practiced:

* DNS Resolution
* ICMP and Ping
* Network Latency Measurement
* Default Gateway and Routing
* Public vs Private IP Addresses
* TCP and UDP Ports
* Linux Network Troubleshooting
* Command-Line Networking Tools
* Bash Scripting Automation

---

# Future Improvements

* Colored output (Green/Red status indicators)
* DNS response time measurement
* Traceroute integration
* Report generation (`report.txt`)
* Logging functionality
* Network interface information
* Continuous monitoring mode

---

# Skills Demonstrated

* Linux Administration
* Bash Scripting
* Network Troubleshooting
* DNS Diagnostics
* Routing Analysis
* System Monitoring
* Command-Line Automation

---

# Author

**Vaishnav Chavan**

Aspiring DevOps / Cloud Engineer

Learning Linux, Networking, AWS, Docker, CI/CD, Kubernetes, and Infrastructure Automation.
