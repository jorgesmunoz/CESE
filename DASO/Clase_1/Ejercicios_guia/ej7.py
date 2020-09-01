# Python3 code to demonstrate  
# converting comma separated string 
# into dictionary
arch = open("config.txt", "r")
d = {}

def read_txt(archivo):
    lines = archivo.readlines()
    for element in lines:
        if element != '\n':
            k = element.strip("\n").split("=")
            d[k[0]] = k[1]
    return d

print(read_txt(arch))