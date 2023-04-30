# linux
правила для фаервола через iptables
#!/bin/bash

MyWebServerIP="192.168.56.4/32"
MyMonitoringServerIP="5.101.102.99/32"
MyHomeNetwork="1.1.1.0/24"
MyHomeNetwork2="1.0.0.0/24"
MyWorkNetwork="2.2.2.0/24"
MyLANips="10.10.1.0/23"

#remove all previous made rules:
sudo iptables --flush

#Allow access to Loopback interfaces
sudo iptables -A INPUT -i lo -j ACCEPT

#Allow any already established connections.
sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

#Allow access to web server:
sudo iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -p tcp --dport 443 -j ACCEPT

#Allow access from Home and Office:
sudo iptables -A INPUT -s $MyHomeNetwork -d $MyWebServerIP -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -s $MyHomeNetwork2 -d $MyWebServerIP -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -s $MyWorkNetwork -d $MyWebServerIP -p tcp --dport 22 -j ACCEPT

#Allow access from the Monitoring server via SNMP:
sudo iptables -A INPUT -s $MyMonitoringServerIP -d $MyWebServerIP -p udp --dport 161 -j ACCEPT

#Allow access with ICMP:
sudo iptables -A INPUT -p icmp -j ACCEPT

#Allow access to FTP server:
sudo iptables -A INPUT -s $MyHomeNetwork -d $MyWebServerIP -p tcp -m tcp --dport 21 -j ACCEPT
sudo iptables -A INPUT -s $MyHomeNetwork2 -d $MyWebServerIP -p tcp -m tcp --dport 21 -j ACCEPT
sudo iptables -A INPUT -s $MyWorkNetwork -d $MyWebServerIP -p tcp -m tcp --dport 21 -j ACCEPT

sudo iptables -A INPUT -s $MyHomeNetwork -d $MyWebServerIP -p tcp -m tcp --dport 1030:1040 -j ACCEPT
sudo iptables -A INPUT -s $MyHomeNetwork2 -d $MyWebServerIP -p tcp -m tcp --dport 1030:1040 -j ACCEPT
sudo iptables -A INPUT -s $MyWorkNetwork -d $MyWebServerIP -p tcp -m tcp --dport 1030:1040 -j ACCEPT

#Allow access from LAN to NTP:
sudo iptables -A INPUT -s $MyLANips -d $MyWebServerIP -p udp --dport 123 -j ACCEPT

#Drop all other connectoins:
sudo iptables -A INPUT -j DROP