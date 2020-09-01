from persona import Persona

def main():

    p1 = Persona("J1", 33)
    p2 = Persona("J2", 23)
    p3 = Persona("J3", 13)

    personas = []

    personas.append(p1)
    personas.append(p2)
    personas.append(p3)

    Persona.print_personas(personas)

    Persona.dump_csv("personas.csv", personas)

main()