class Device:



    def __init__(self, id, name, ip, status):
        self.__id = id
        self.__name = name
        self.__ip = ip
        self.__status = status

    @staticmethod
    def object_to_dict(obj):
        return {"id":obj.__id, "name":obj.__name, "status":obj.__status}
    