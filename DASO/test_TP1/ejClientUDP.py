import socket
import json
import sys
import os
import signal
import time
import csv
import traceback

class Reader:

    def __init__(self):
        self.path = "config.txt"

    def read_config(self):
        with open(self.path, "r") as f:
            csv_name = str(f.readline())
            return csv_name

    def get_values(self, archive):
        lista = []
        with open(archive, newline='') as f:
            reader = csv.DictReader(f)
            for row in reader:
                lista.append(dict(row))
        
        return lista
        
class Parser:

    @staticmethod
    def parseData(data):
        return json.dumps(data)

class Main:

    def __init__(self):
        pass

    def main(self):

        signal.signal(signal.SIGINT, self.handler)  # hacerlo en el thread ppal. El handler siempre se ejecuta en el thread ppal.

        UDP_PORT = 10000
        UDP_IP = "localhost"

        self.reader = Reader()

        try:
            UDP_PORT = int(sys.argv[1])
        except:
            print("Puerto incorrecto")
            exit(1)

        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        print("Enviando mensajes por puerto  puerto "+str(UDP_PORT)+"...")
        while True:
            config = self.reader.read_config()
            csv_data = self.reader.get_values(config)
            data = Parser.parseData(csv_data)
            print("Wait")
            s.sendto(data.encode('utf-8'), (UDP_IP, UDP_PORT))
            time.sleep(10)

    def handler(self, sig, frame):  # define the handler  
        #print("Signal Number:", sig, " Frame: ", frame)  
        #traceback.print_stack(frame)
        raise SystemExit("Se presiono ctrl+c. End of process.")
        
m = Main()
m.main()