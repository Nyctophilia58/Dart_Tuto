import 'sealed_class.dart';

void main() {}

// The sealed class `Shape` can only be extended by classes defined in the same library. This allows for exhaustive pattern matching and ensures that all possible subclasses are known at compile time.
// class Square extends Shape {
//   final double side;
//   const Square(this.side);
// }