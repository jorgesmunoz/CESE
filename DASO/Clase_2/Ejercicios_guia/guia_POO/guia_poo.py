from persona import Persona

archivo = "personas.csv"

personas = []

p1 = Persona("Jorge", 33)
p2 = Persona("Natalia", 34)
p3 = Persona("Gabriela", 30)

personas.append(p1)
personas.append(p2)
personas.append(p3)

#Se pone el nombre de la clase (Persona) para llamar a un metodo estatico
Persona.print_persona(personas)

print("El mayor es: {}".format(Persona.get_mayor(personas)))

if p1.es_mayor_de_edad():
    print("Es mayor de edad!")

if p1.es_mayor_que():
    print("Es mayor que actual!")
else:
    print("Es menor que actual!")

#Escribe archivo
Persona.dump_csv(archivo, personas)
#Lee archivo
print(Persona.load_csv(archivo))