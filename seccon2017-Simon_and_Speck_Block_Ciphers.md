![](sss/5.png)

Soruda Simon_96_64 kullanıldığı söylenmiş, yani anahtarın uzunluğu 96, bloğun uzunluğu 64 bit. Yani key'de 96/8=12 karakterden oluşuyo. Bizim sadece 4 hanesini bulmamız lazım. Printable karakterlerle brute force saldırısı yapabiliriz. Github'ta simon şifreleri için bi kütüphane [mevcut](https://github.com/inmcm/Simon_Speck_Ciphers/tree/master/Python). Brute force için script yazalım.

```python
import simon, itertools
func = lambda x: simon.SimonCipher(int(("SECCON{"+x+"}").encode("hex"),16),mode="ECB",key_size=96,block_size=64).encrypt(0x6d564d37426e6e71)
for i in itertools.permutations(string.printable[:62],4):
  if func("".join(i)) == 0xbb5d12ba422834b5:
    print "SECCON{" + "".join(i) + "}"
    break
```
**SECCON{6Pz0}**
