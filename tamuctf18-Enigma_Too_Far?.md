Enigma Nazilerin 2. Dünya savaşında kullandığı bir şifreleme makinesidir. Sınıf olarak Vigenere şifresinin karmaşıklaştırılmış halidir.Bu konuyla ilgili Tubitak yayınlarından bir [kitapta](https://www.google.com.tr/search?ei=bsOqWpeFJIa6kwWRpKI4&q=enigma+s%C3%BCleyman+sevin%C3%A7&oq=enigma+s%C3%BCleyman+sevin%C3%A7&gs_l=psy-ab.3..0i203k1.1515.2527.0.2737.4.2.0.2.2.0.220.220.2-1.1.0....0...1c.1.64.psy-ab..1.3.228....0.w91xLOiyFhQ) var. Soruda bizden bu makineyle şifrelenmiş, metni çözmemizi istiyor.Bunun için bir [piton kütüphanesi](https://py-enigma.readthedocs.io/en/latest/overview.html) var.
Sayfada deşifrelemek için örnek bir kodda verilmiş.

```python
from enigma.machine import EnigmaMachine

# setup machine according to specs from a daily key sheet:

machine = EnigmaMachine.from_key_sheet(
       rotors='II IV V',
       reflector='B',
       ring_settings=[1, 20, 11],
       plugboard_settings='AV BS CG DL FU HZ IN KM OW RX')

# set machine initial starting position
machine.set_display('WXC')

# decrypt the message key
msg_key = machine.process_text('KCH')

# decrypt the cipher text with the unencrypted message key
machine.set_display(msg_key)

ciphertext = 'NIBLFMYMLLUFWCASCSSNVHAZ'
plaintext = machine.process_text(ciphertext)

print(plaintext)
```

Soruda eksik olan bölümler **reflector**, **ring_settings** ve **set_display**. </br>
**reflektörler**: B, C, B-Thin, C-Thin </br>
**ring ayarları**: 1-25, 1-25, 1-25 </br>
**başlangıç noktası**: A-Z, A-Z, A-Z

Şimdi bu verileri kullanarak bir kaba kuvvet saldırısı yapalım.

```python
from enigma.machine import EnigmaMachine

def enigma(ref,ring):
    return EnigmaMachine.from_key_sheet(
           rotors = 'I II III',
           reflector = ref, 
           ring_settings = ring,
           plugboard_settings = "AV BS CG DL FU HZ IN KM OW RX")
           
import itertools, string

refs= ["B", "C", "B-Thin", "C-Thin"]
rings = itertools.product(range(25),repeat=3)
inits = map("".join,itertools.product(string.ascii_uppercase,repeat=3))

c = "IPUXZGICZWASMJFGLFVIHCAYEGT"
p = "HOWDYAGGIESTHEWEATHERISFINE"

def key():
       for i in refs:
              for j in rings:
                     for k in inits:
                            e = enigma(i,j)
                            e.set_display(k)
                            if e.process_text(c) == p:
                                   return [i,j,k]

print key()
                                   
```

**['B', (0, 0, 15), 'HYB']**. Şimdi şifreli metni çözelim.

```python
c = "LTHCHHBUZODFLJOAFNNAEONXPLDJQVJCZPGAVOLN"

e = enigma("B",(0, 0, 15))
e.set_display("HYB")
print e.process_text(c)
```
**PASSWORDISGIGEMXHISTORYROCKSLEARNCRYPTOX**




                            
                     

           

           












