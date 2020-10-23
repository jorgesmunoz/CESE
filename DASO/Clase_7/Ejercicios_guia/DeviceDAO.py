from Device import Device

class DeviceDAO:


    def __init__(self, conn):
        self.conn = conn

    def set_state(self, id, status):
        try:
            c = self.conn.cursor()
            params = (status,id)
            c.execute("UPDATE Devices SET status=status? WHERE id=?",params)
            self.conn.commit()            
        except Exception as e:
            print(e)
            return False
        else:
            return True
        finally:
            #Cierre del cursor abierto en el try
            c.close()

    def get_all(self):
        c = self.conn.cursor()
        c.execute("SELECT id,name,ip,status FROM Devices")
        d = c.fetchall()
        c.close()
        #Construir la lista de objetos device y devolverla
        list_devices = []
        for row in d:
            #row[0] row[1] row[2] row[3]
            #id,name,ip,status
            dev = Device(row[0], row[1], row[2], row[3])
            list_devices.append(dev)
        
        return list_devices