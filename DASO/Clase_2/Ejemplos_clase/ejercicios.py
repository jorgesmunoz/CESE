from persona import Persona

p = Persona("Jorge", 33)
#p.set_edad(33)
#p.set_nombre("Jorge")

print(type(p))

print("{} {}".format(p.get_nombre(), p.get_edad()))

if p.es_mayor_de_edad():
    print("Es mayor de edad!\r\n")
