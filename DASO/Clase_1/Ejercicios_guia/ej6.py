import csv

lista_tupla = []

def create_list():
    num = int(input("Ingrese cantidad de registros: "))
    while num > 0:
        name = input("Ingrese nombre: ")
        address = input("Ingrese direccion: ")
        age = input("Ingrese edad: ")
        lista_tupla.append(((name, address, age)))
        num = num - 1
    
    return lista_tupla

def create_csv(arg1):
    with open('names.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(("name", "address", "age"))
        writer.writerows(arg1)

create_csv(create_list())

print(lista_tupla)