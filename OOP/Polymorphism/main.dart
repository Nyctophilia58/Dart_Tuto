import 'rectangle.dart';
import 'shape.dart';
import 'triangle.dart';

void main() {
  Shape shapeR = Rectangle();
  shapeR.draw();
  Shape shapeT = Triangle();
  shapeT.draw();
}

