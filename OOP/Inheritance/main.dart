import 'child.dart';

void main() {
  Child child = Child('Alice', 10, 'Drawing');
  print('Name: ${child.name}');
  print('Age: ${child.age}');
  print('Hobby: ${child.hobby}');
}