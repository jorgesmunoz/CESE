archivo = "monedas.csv"
monedas = "1,Dolar,58.63,61.61\n2,Euro,65.12,68.93\n3,Real,13.45,14.23\n"
monedas += "4,Dolar,57.15,60.62\n5,Euro,63.11,66.71\n6,Real,12.52,13.79\n"

with open(archivo, "w", encoding="utf-8") as f:
    #Se define primera linea
    line = "id,nombre,compra,venta\n"
    f.write(line)
    f.write(monedas)

with open(archivo, "r", encoding="utf-8") as f:
    #Se define primera linea
    lines = f.readlines()
    for line in lines:
        print(line)

path = "config.txt"

with open(path, "w", encoding="utf-8") as f:
    #Se define primera linea
    line = "monedas.csv"
    f.write(line)
