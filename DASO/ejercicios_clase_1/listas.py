l = [1, 2, 3, 4, 5 ]
print(l)
print(l[2])
print(l[-1])
print(l[1:3])

for elemento in l:
    print(elemento)

l.append(6)
l.remove(2) #por valor
print(l)

del l[2] #por posición
print(l)