```
sysctl -w net.ipv4.ip_forward=1
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/99-ip-forward.conf
sysctl -p /etc/sysctl.d/99-ip-forward.conf
```