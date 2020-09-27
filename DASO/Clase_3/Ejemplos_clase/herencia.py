class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self):
        return self.length * self.width

    def perimeter(self):
        return 2 * self.length + 2 * self.width

class Square(Rectangle):
    def __init__(self, length):
        super().__init__(length, length)

print("Arranca el programa\n")

r = Rectangle(10, 20)

print("Area:" + str(r.area()))
print("Perimetro:" + str(r.perimeter()))
print(type(r))

s = Square(10)

print("Area:" + str(s.area()))
print("Perimetro:" + str(s.perimeter()))
print(type(s))

print("r es Rectangle?" + str(isinstance(r, Rectangle)))
print("r es Square?" + str(isinstance(r, Square)))

print("s es Rectangle?" + str(isinstance(s, Rectangle)))
print("s es Square?" + str(isinstance(s, Square)))
