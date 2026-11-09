import 'parent.dart';

class Child extends Parent {
  String hobby;

  Child(String name, int age, this.hobby) : super(name, age);
}