import myconfig

arch = open("configuracion_ej9.txt", 'r+', newline='')

myconfig.write_archive(arch)
myconfig.read_archive(arch)

