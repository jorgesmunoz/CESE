from flask import Flask, request
import sqlite3
from flask import g
import json
from ControllerDevices import ControllerDevices

app = Flask(__name__)

#************** Manejo de DB ****************************
DATABASE = 'devices.db3'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()
#________________________________________________________

@app.route('/devices')
def hello_world():
	cont = ControllerDevices(app, request, get_db())
	return cont.get()

@app.route('/device/<idDevice>', methods=["PUT"])
def device(idDevice):
	cont = ControllerDevices(app, request, get_db())
	return cont.put(idDevice)

if __name__ == '__main__':
	app.debug = True
	app.run()
