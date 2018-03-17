Sorunun adından anlaşılabileceği gibi elimizdeki yüksek olasılıkla xorlanmış çalıştırılabilir bir dosya. Dosyaların son kısımları genelde 0 olduğu için bu bölümden yararlanabiliriz. Dosyanın son 10 satırına bakalım.

```bash
hexdump hexxy | tail -n 10
0002030 4259 6731 6c33 4234 752d 507a 6a6a 3444
0002040 4258 6731 6c30 4234 7535 507a 6a6a 3444
0002050 4251 6731 6c33 4234 635d 507a 6a6a 3444
0002060 405e 6731 6c33 4234 7535 507a 6a6a 3444
0002070 4250 6731 6c33 4234 7535 507a 6a6a 3444
0002080 4240 6731 6c30 4234 7535 507a 6a6a 3444
0002090 4251 6731 6c33 4234 6d42 507a 6a6a 3444
00020a0 4352 6731 6c33 4234 7535 507a 6a6a 3444
00020b0 4250 6731 6c33 4234 7535 507a 6a6a 3444
00020c0
```
Anahtarın 16 karakter uzunluğunda olduğu anlaşılıyor. Bir çalıştırılabilir dosyada yan yana gelme olasılığı en yüksek olan karakterler 16 "\x00". Bize verilen dosyada en çok yinelenen 16'lığı bulursak anahtarı da bulmuş oluruz. Çünkü 0 xor işleminde etkisiz.

```python
file = open("hexxy","rb").read()
l16 = [file[i:i+16] for i in range(0,len(file),16)]
from collections import Counter
key = Counter(l16).most_common(1)[0][0]
print(key)
```

**QB1g3l4B5uzPjjD4**. Anahtarı bulduk, şimdi bütün dosyaya uygulayalım.

```python
from pwn import *
bin = "".join([xor(i,key) for i in l16])
open("bin","wb").write(bin)
```
Kaydettiğimiz dosyayı çalıştıralım.

```bash
chmod +x bin | ./bin
```
Congrats! You found the flag!
**GigEm{NibblerEatsNibbles}**



