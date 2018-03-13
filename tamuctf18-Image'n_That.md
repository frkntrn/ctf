Soruda resmin **AES-ECB** modunda şifrelendiği söylenmiş, bu modun problemi, aynı açık metin metin bloğunu aynı şifreli metin bloğuna çevirecek olması. O yüzden çıkan renklerde öncekilerle ilişkili olacak.
Sütunların aynı rengi takip ettiğini görebiliyoruz. Bu durumu kullanıp, 1. satırla aynı renk pikselleri beyaza, geri kalanı siyaha boyayalım.

```python
from PIL import Image
img = Image.open("encypted.bmp")
rgb = img.convert("RGB")
pix = rgb.load()
for i in range(1,1152):
  for j in range(1,648):
    if pix[i,j] == pix[i,0]:
      pix[i,j] = (255,255,255)
    else:
      pix[i,j] = (0,0,0)
rgb.save("res.png")
```
![](https://github.com/frkntrn/ctf/blob/master/sss/6.png)
**GIGEM{THE_WORLD_IS_IN_THE_EYE_OF_THE_BEHOLDER}**
