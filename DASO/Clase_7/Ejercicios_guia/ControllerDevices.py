import json
from DeviceDAO import DeviceDAO
from Device import Device

class ControllerDevices:



    def __init__(self, app, request, conn):
        self.app = app
        self.request = request
        self.conn = conn

    def put(self,id_device):
        devDao = DeviceDAO(self.conn)
        #status me vino en el body
        status = self.request.form['state']
        devDao.set_state(id_device, status)
        return "OK!"


    def get(self):
        devDao = DeviceDAO(self.conn)
        list_devices = devDao.get_all()
        #Me devuelve una lista de objetos Device
        return json.dumps(list_devices, default = Device.object_to_dict)