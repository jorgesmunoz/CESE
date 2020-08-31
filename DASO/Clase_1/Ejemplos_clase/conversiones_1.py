s="\u00D1" # unicode de la Ñ
print(s)

ba = s.encode("utf-8") #pasamos a bytes
print(ba)   #0xC3 0x91 es la Ñ en UTF-8

s2 = ba.decode("utf-8") #pasamos a string
print(s2)