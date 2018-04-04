**tshark**</br>
```bash
tshark -r data.pcap -Y 'icmp and !(ip.src==128.227.236.205) and ip.src==10.136.255.127' -x | grep "0020" | cut -d" " -f5 | sed ':a;N;$!ba;s/\n//g' | xxd -r -p > output.gif
```

**find**
```bash
find . -type f -name "today*" -exec sed -i 's/apple/banana/g' \;
```
