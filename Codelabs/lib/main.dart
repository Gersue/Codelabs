import 'dart:math';

//Clases Bicicleta
class Bicycle {
  int candence;
  int _speed = 0;
  int get speed => _speed;
  int gear;


  Bicycle(this.candence, this.gear);

  //metodos
  void applyBrake(int decrement){
    _speed -= decrement;
  }

  void speedUp(int increment){
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}
//Clase Rectangulo
class Rectangle{
  int width;
  int height;
  Point origin;

  Rectangle ({this.origin = const Point(0,0), this.width = 0, this.height =0});

  @override
String toString() => 'Origin: (${origin.x}, ${origin.y}), width: $width, heigth: $height';
}
//Clase Shape
abstract class Shape{
  factory Shape(String type){
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'can \'t create $type.';
  }
  num get area;
}

class Circle implements Shape{
  final num radius;
  Circle(this.radius);
  num get area =>pi * pow(radius, 2);
}

class Square implements Shape{
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

class CircleMock implements Circle{
  num area = 0;
  num radius = 0;
}
//Programacion Funcional
String scream (int length) => "A${'a' * length}h!";

 main() {
  var bike = new Bicycle(2, 1);
  print(bike);
  print('\n');
  print (Rectangle(origin: const Point(10, 30),width: 100, height: 200));
  print (Rectangle(origin: const Point(10, 10)));
  print (Rectangle(width: 100));

  //Datos de nuestra clase Shape
  /* final circle = Circle(2);
   final square = Square(2);
   print('\n');
   print(circle.area);
  print(square.area);*/

  //ShapeFactory
   final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);

  print('\n Programacion Funcional');
  final values = [1, 2, 3, 5, 10, 50];
  /*for(var length in values){
    print(scream(length));
  }*/
   //Pasar de imperativo a funcional
   /*values.map(scream).forEach(print);*/

   //para usarlo mas funcional seria
   values.skip(3).take(3).map(scream).forEach(print);
}
