
try:
	n = int(input("ingrese numero:"))
	print(n)
	#exit()
except Exception as e:
	print("error")
	print(e)
#Si no falla entra acá
else:
	print("Success")
#Se ejecuta siempre, falle o no
finally:
	print("At last")

