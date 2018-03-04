![](https://latex.codecogs.com/gif.latex?c=m^{e}(modN))</br></br>

Bizden çözmemiz istenen şifreli metin dışında, her şifreli metni deşifre edebiliyoruz. Yani seçtiğimiz şifreli metinle saldırı (COA) gerçekleştirebiliyoruz. Öyle bir şifreli metin seçmeliyiz ki, deşifre ettiğimizde, bize verilen şifreli metnin açık metniyle(m) ilişikili olsun.</br></br>

![](https://latex.codecogs.com/gif.latex?C=2^{e}*c(modN))</br>
![](https://latex.codecogs.com/gif.latex?(2^{e}*c)^{d}=2^{ed}*c^{d}=2*m(modN))</br></br>

Şifreli metni (C) yukarıdaki gibi seçersek, C'nin açık metninin çözümün 2 katı olduğunu görüyoruz. Metinler little endian olduğundan kodda çevirmemiz gerekecek.

```python
cevir = lambda x: "".join([x[i:i+2] for i in range(0,len(x),2)][::-1])

N6 = '00:b9:61:cd:4d:b6:cc:a2:c5:ec:44:d1:e6:69:e5:2b:85:05:74:a5:57:5c:09:3a:a7:40:d2:23:a7:b4:2a:48:ed:3d:47:8a:c3:e9:10:c7:93:d2:9f:da:13:f2:3c:ec:d0:0b:d0:ac:bd:cd:b7:0a:b1:f6:d5:e9:82:1b:85:15:3f:39:81:f2:07:cf:5f:a2:0f:cd:f5:e4:e4:32:b1:d3:fb:b3:b0:12:d7:d2:70:40:0d:5c:67:c9:9a:ba:eb:2f:f3:c0:8e:5b:29:c8:07:b1:24:3a:29:73:87:ff:06:44:3c:09:77:db:f2:f2:84:a9:48:d4:5c:16:96:eb:a4:59:bf'
N = int("".join(N6.split(":")),16)

e = 65537

c6 = 'a0b75ef5dfd9ab0de9aa8c36a9c5aa28a924128a62826740ac3986efac69e2b85fc0df803e80da04c5f803726689e5f3134178de3cb203f6aebca22b376f7205d93a7224aca82cbbdc382200a1749fee095dfebe2aaabf99b622e4343bf5423cf6527433e26273e67d576157bf65a9258f613be9ad88d7b50350a89e676ae462'
c = int(cevir(c),16)

C = (pow(2,e,N)*c)%N
C6 = cevir(hex(C)[2:-1])
