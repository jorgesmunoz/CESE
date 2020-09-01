archivo = open('diccionario.txt', 'w', newline='')
diccionario = {'path': '/home/user/data.txt', 
                'timeout': '5', 
                'autostart': '1', 
                'backup': '15:30', 
                'cache_folder': '/tmp/cache', 
                'serial': '/dev/ttyUSB01'}

def write_txt(archive, dictionary):
    keys = list(diccionario.keys())
    values = list(diccionario.values())
    string = ""
    
    for i in range(len(keys)):
        string = string + str(keys[i] + "=" + values[i] + "\n")
    
    archive.write(string)

write_txt(archivo, diccionario)
