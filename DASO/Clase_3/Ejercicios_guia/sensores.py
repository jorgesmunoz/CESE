class Sensor:
    def __init__(self, numero_sensor):
        self.numero_sensor = numero_sensor
    
    def read_file(self, file_name):
        with open(file_name, "r") as f:
            return float(f.read())

    def get_value(self):
        raise Exception("No esta implementado el metodo!")
        #return 0

class SensorTemperatura(Sensor):
    def __init__(self, numero_sensor):
        super().__init__(numero_sensor)

    #Override de metodo get_value
    def get_value(self):
        #Construir path al sensor segun mi numero se sensor
        path = "/tmp/temp{}.data".format(self.numero_sensor)
        #Llamar a read_file
        valor = self.read_file(path)
        #Ajuste del valor leido (truncar la parte negativa)
        if valor <= 0:
            valor = 0.0
        return valor

class SensorHumedad(Sensor):
    def __init__(self, numero_sensor):
        super().__init__(numero_sensor)

    #Override de metodo get_value
    def get_value(self):
        #Construir path al sensor segun mi numero se sensor
        path = "/tmp/hum{}.data".format(self.numero_sensor)
        #Llamar a read_file
        valor = self.read_file(path)
        #Ajuste del valor leido (dividir por 10)
        return valor / 10
