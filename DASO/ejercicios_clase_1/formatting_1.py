age=33
name="Jorge"

msg = "Hola, {1}. Tenes {0}.".format(age, name)

print(msg)

msg = "Hola, {1}. Tenes {0:03d}.".format(age, name)

print(msg)