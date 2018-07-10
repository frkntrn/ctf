#!/bin/bash
curl -s "https://storage.googleapis.com/gctf-2018-attachments/2cdc6654fb2f8158cd976d8ffac28218b15d052b5c2853232e4c1bafcb632383" -o tmp
while true; do
    fname=$(ls | grep -v getflag.sh)
    if [ "$fname" != "tmp" ]; then mv $fname tmp; fi
    if grep -q password.txt tmp; then break; fi
    xname="tmp.$(file -b tmp | awk '{print tolower($1)}')"
    mv tmp $xname
    dtrx -foq $xname
    if [ $(ls | wc -l) -gt 2 ]; then rm -r $xname; fi
done
unzip -P asdf -q tmp
cat password.txt
ls | grep -v getflag.sh | xargs rm -r
