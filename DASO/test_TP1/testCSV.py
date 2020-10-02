import csv

#input_file = csv.DictReader(open("monedas.csv"))
lista = []


with open('monedas.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        #print(dict(row))
        lista.append(dict(row))

print(lista)
        