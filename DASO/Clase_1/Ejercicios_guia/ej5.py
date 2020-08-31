texto = "Hola yo soy una PC"

def recibe_string(arg1):
    return texto.replace(" ", arg1)

caracter = input("Ingrese un caracter: ")

print(recibe_string(caracter))