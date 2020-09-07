class Persona:

    MAYORIA_EDAD = 18
    EDAD_ACTUAL = 50
    EDAD_MAYOR = 0

    def __init__(self, nombre, edad):
        self.set_nombre(nombre)
        self.set_edad(edad)

    def set_nombre(self, nombre):
        self.nombre = nombre

    def set_edad(self, edad):
        self.edad = edad
    
    def get_nombre(self):
        return self.nombre

    def get_edad(self):
        return self.edad
    
    def es_mayor_de_edad(self):
        if self.get_edad() >= Persona.MAYORIA_EDAD:
            return True
        else:
            return False

    def es_mayor_que(self):
        if self.get_edad() > Persona.EDAD_ACTUAL:
            return True
        else:
            return False

    @staticmethod
    def print_persona(personas):
        for p in personas:
            print("Nombre: {} -> Edad: {}" .format(p.get_nombre(), p.get_edad()))

    @staticmethod
    def get_mayor(personas):
        edad_mayor = Persona.EDAD_MAYOR
        for p in range(len(personas)):
            if personas[p].get_edad() > edad_mayor:
                edad_mayor = personas[p].get_edad()
                mayor = personas[p].get_nombre()
        return mayor

    @staticmethod
    def dump_csv(archivo, personas):
        with open(archivo, "w", encoding="utf-8") as f:
            line = "nombre,edad\n"
            f.write(line)
            for p in personas:
                line = "{},{}\n".format(p.get_nombre(), p.get_edad())
                f.write(line)

    @staticmethod
    def load_csv(archivo):
        with open(archivo, "r", encoding="utf-8") as f:
            #Lee primera linea para no tenerla en cuenta
            f.readline()
            lines = f.readlines()
            return lines

        
        
