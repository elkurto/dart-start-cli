import 'dart:math';

// see https://dart.dev/language#interfaces-and-abstract-classes
/*
 dart bin/008_00_abstract_class.dart 

    circleA =Cicle(r=1.0) :: circleA.computeArea() =3.141592653589793
    circleB =Cicle(r=2.0) :: circleA.computeArea() =12.566370614359172
    squareA =Square(side=1.0) :: squareA.computeArea() =1.0
    squareB =Square(side=2.0) :: squareB.computeArea() =4.0
*/
interface class Stringifyable {
  String stringify() {
    return "Stringifyable()";
  }
}

abstract class Shape2d {
  double computePerimeter();
  double computeArea();
}

class Circle extends Shape2d implements Stringifyable {
  double radius = 0.0;
  Circle(this.radius);

  @override
  double computeArea() {
    return radius * radius * pi;
  }

  @override
  double computePerimeter() {
    return 2.0 * radius * pi;
  }

  @override
  String stringify() {
    return "Cicle(r=$radius)";
  }
}

class Square extends Shape2d implements Stringifyable {
  double side = 0.0;
  Square(this.side);

  @override
  double computeArea() {
    return side * side;
  }

  @override
  double computePerimeter() {
    return side * 4.0;
  }

  @override
  String stringify() {
    return "Square(side=$side)";
  }
}

void main(List<String> args) {
  Circle circleA = Circle(1.0);
  Circle circleB = Circle(2.0);

  Square squareA = Square(1.0);
  Square squareB = Square(2.0);

  print(
    "circleA =${circleA.stringify()} :: circleA.computeArea() =${circleA.computeArea()}",
  );
  print(
    "circleB =${circleB.stringify()} :: circleA.computeArea() =${circleB.computeArea()}",
  );
  print(
    "squareA =${squareA.stringify()} :: squareA.computeArea() =${squareA.computeArea()}",
  );
  print(
    "squareB =${squareB.stringify()} :: squareB.computeArea() =${squareB.computeArea()}",
  );
}
