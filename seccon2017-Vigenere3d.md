
![](sss/1.png)

s yerine daha küçük bir string atayıp kodun ne yaptığını daha iyi görelim.
```python
def _l(idx, s):
    return s[idx:] + s[:idx]
s = "abcdef"
t = [[_l((i+j) % len(s), s) for j in range(len(s))] for i in range(len(s))]
```
s="abcdef" olduğunda, t matrisinin çıktısı:

![](sss/2.png)

Stringleri, satır ve sütun değerlerinin toplamının, stringin uzunluğuyla modu kadar döndürüyo. Bu bilgi bi kenarda dursun.

```python
print main(sys.argv[1], sys.argv[2], sys.argv[2][::-1])
```

Terminalden alınan iki argümandan, 1.si **p**, 2.si **k1** olarak alınıp, 2.sinin tersi de main fonksiyonuna **k2** olarak alınıp, for döngüsünün içine giriyo.

```python
for a in p:
        c += t[s.find(a)][s.find(k1[i1])][s.find(k2[i2])]
        i1 = (i1 + 1) % len(k1)
        i2 = (i2 + 1) % len(k2)
```

For döngüsünün içinde p'nin her bir elemanı için matristen bi eleman seçerek, şifreyi oluşturucak. Soruda bize **p**'nin **SECCON{** kısmı verilmiş, burdan **k1** hakkında bilgi çıkarabiliriz.

![](sss/3.png)





