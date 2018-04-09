```bash
tcpflow -C -r ids_alert.pcap | sed -n "3p" | cut -d":" -f2 > key; tcpflow -C -r ids_alert.pcap | tr `tr "[:upper:]" "[:lower:]" < key``cat key` `python -c 'import string; print string.ascii_letters'` | grep -Eo "INSA{.*}"
```
