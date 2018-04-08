**tshark**</br>
```bash
tshark -r data.pcap -Y 'icmp and !(ip.src==128.227.236.205) and ip.src==10.136.255.127' -x | grep "0020" | cut -d" " -f5 | sed ':a;N;$!ba;s/\n//g' | xxd -r -p > output.gif
```
```bash
tshark -r pcap.pcap ip.src == 54.175.216.124 | rev | cut -d" " -f3 | rev | cut -d"." -f1 | xxd -r -p | grep -aEo "sun{.*}" | uniq
```

**find**
```bash
find . -type f -name "today*" -exec sed -i 's/apple/banana/g' \;
```
