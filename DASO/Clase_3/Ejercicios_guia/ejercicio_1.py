from sensores import SensorTemperatura, SensorHumedad

"""
s = SensorTemperatura(0)
valor = s.get_value()
print("Lei valor:" + str(valor))

h = SensorHumedad(0)
valor = h.get_value()
print("Lei valor:" + str(valor))
"""

sensors = []

sensors.append(SensorTemperatura(0))
sensors.append(SensorTemperatura(1))
sensors.append(SensorHumedad(0))
sensors.append(SensorHumedad(1))
sensors.append(SensorTemperatura(2))
sensors.append(SensorHumedad(2))

for s in sensors:
    valor = s.get_value()
    print(valor)