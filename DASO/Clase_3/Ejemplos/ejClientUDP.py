import socket
import json

dic = {"id": 1, "value1": 50, "value2": 10, "name": "Dolar"}, {"id": 2,
"value1": 65, "value2": 70, "name": "Euro"}, {"id": 3, "value1":
15, "value2": 20, "name": "Real"}

s = json.dumps(dic)
print(type(s)) 

UDP_IP = "127.0.0.1"
UDP_PORT = 10000
MESSAGE = "Hello, World!"
 
print("UDP target IP: %s" % UDP_IP)
print("UDP target port: %s" % UDP_PORT)
print("message: %s" % MESSAGE)

sock = socket.socket(socket.AF_INET, # Internet
                     socket.SOCK_DGRAM) # UDP
sock.sendto(s.encode('utf-8'), (UDP_IP, UDP_PORT))