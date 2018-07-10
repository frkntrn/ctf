#!/bin/bash
curl -s "https://storage.googleapis.com/gctf-2018-attachments/5a0fad5699f75dee39434cc26587411b948e0574a545ef4157e5bf4700e9d62a" -o letter.zip
unzip -q letter.zip
pdftotext -q challenge.pdf
grep -Eo "CTF{.*}" challenge.txt
ls | grep -v getflag.sh | xargs rm -r
