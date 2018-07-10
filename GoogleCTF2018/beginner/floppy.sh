#!/bin/bash
curl -s "https://storage.googleapis.com/gctf-2018-attachments/4e69382f661878c7da8f8b6b8bf73a20acd6f04ec253020100dfedbd5083bb39" -o floppy.zip
unzip -q floppy.zip
binwalk -eq foo.ico
grep -Eo "CTF{.*}" _*/driver.txt
ls | grep -v getflag.sh | xargs rm -r
