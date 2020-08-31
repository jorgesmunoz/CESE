def es_par(arg1):
    if (arg1 % 2) == 0:
        return True
    else:
        return False

r = es_par(int(input("Ingrese un numero:")))

if r:
    print("Es par")
else:
    print("Es impar")