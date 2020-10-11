import sqlite3

conn = sqlite3.connect('mydb.db3')
print(type(conn))

c = conn.cursor()
print(type(c))


c.execute('SELECT * FROM Users')

print(c.fetchone())     #lee uno
print(c.fetchone())

#print(c.fetchall())    #lee todos

print("----")

for row in c:          #iterable
    print(row)

c.close()

conn.close()

