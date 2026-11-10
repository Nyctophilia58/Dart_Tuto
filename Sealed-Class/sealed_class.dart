sealed class Shape {
  const Shape();
}


class Circle extends Shape {
  final double radius;
  const Circle(this.radius);
}

class Rectangle extends Shape {
  final double width;
  final double height;
  const Rectangle(this.width, this.height);
}

class Triangle<T> extends Shape {
  final T base;
  final T height;
  const Triangle(this.base, this.height);
}