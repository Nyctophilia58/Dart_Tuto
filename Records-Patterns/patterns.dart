// Patterns in dart are a way to match and destructure data structures, such as records, lists, and maps. They allow you to extract values from these data structures in a concise and readable way.
// Patterns can be used in various contexts, such as variable declarations, switch statements, and function parameters. They can also be combined with other language features, such as null safety and type inference, to create powerful and expressive code.

// Examples
void main() {
  // Using a pattern to destructure a record
  var (x, y) = (1, 2);
  print('x: $x, y: $y'); // Output: x: 1, y: 2

  // Using a pattern in a switch statement
  var point = (3, 4);
  switch (point) {
    case (0, 0):
      print('Origin');
      break;
    case (var x, var y):
      print('Point at ($x, $y)');
      break;
  }

  // Using a pattern in a function parameter
  void printPoint((int x, int y) point) {
    var (x, y) = point;
    print('Point at ($x, $y)');
  }
  printPoint((5, 6)); // Output: Point at (5, 6)
}