class Persona:
    #Si se define en la clase es porque es estático
    MAYORIA_EDAD = 18 #Equivale a #define del lenguaje "C"

    def __init__(self, nombre, edad):
        #self.__nombre = nombre
        #self.__edad = edad
        self.set_nombre(nombre)
        self.set_edad(edad)
    
    def set_nombre(self, nombre):
        if nombre != "":
            self.__nombre = nombre

    def set_edad(self, edad):
        self.__edad = edad

    def get_nombre(self):
        return self.__nombre

    def get_edad(self):
        return self.__edad

    def es_mayor_de_edad(self):
        if self.get_edad() >= Persona.MAYORIA_EDAD:
            return True
        else:
            return False

    @staticmethod
    def print_personas(personas):
        for p in personas:
            print(p.get_nombre())

    @staticmethod
    def dump_csv(nombre_archivo, personas):
        with open(nombre_archivo, "w", encoding="utf-8") as f:
            line = "nombre,edad\n"
            f.write(line)
            for p in personas:
                #line = p.get_nombre() + "," + str(p.get_edad()) + "\n"
                line = "{},{}\n".format(p.get_nombre(),p.get_edad())
                print(line)
                f.write(line)
