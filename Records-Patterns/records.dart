/* 
  Records are anonymous, immutable, aggregate types. With records, you can group multiple values into a single value without creating a class or struct. Records are useful for returning multiple values from a function or for grouping related data together.
  Records are defined using parentheses and can contain any number of values of any type. Each value in a record is called a field, and fields can be accessed using their position in the record or by using named fields.
  Records indext starts at 1, so the first field in a record is accessed using the index 1, the second field is accessed using the index 2, and so on. Named fields can be accessed using their names.
  Type is the shape of the record, which is determined by the number and types of its fields. For example, a record with two fields of type int and String has the type (int, String). Records can also have named fields, which are specified using the syntax (fieldName: fieldType).
*/

void main() {
  // record with two fields
  (int, String) record1 = (42, 'Hello');
  (String, int) record2 = ('World', 2);

  print(record1.$1); // Accessing the first field of record1
  print(record2.$2); // Accessing the second field of record2

  (int, ) record3 = (99, ); // single field record with an int value
  var record4 = (3.14,); // single field record with a double value

  print(record3.$1); // Accessing the first field of record3
  print(record4.$1); // Accessing the first field of record4

  // type of named fields
  ({int x, String y}) record5 = (x: 10, y: 'Hello');
  print(record5.x); // Accessing the named field 'x' of record5

  var record6 = ("first", a: 2, b: 3, "last"); // record with named fields and positional fields
  print(record6.$1); // Accessing the first field of record6
  print(record6.a); // Accessing the named field 'a' of record6
  print(record6.$2); // Accessing the second field of record6

  // type of records with named and positional fields 
  // positional fields are accessed using their index, while named fields are accessed using their names.
  // positional fields are accessed using the $ symbol followed by the index of the field, while named fields are accessed using their names directly.
  // positional fields are written first in the record, followed by named fields. The order of the fields in the record is important, as it determines the type of the record.
  (double, {int a, String b, bool c}) record7 = (a: 10, b: 'Hello', 3.14, c: true);
  print(record7.$1); // Accessing the first field of record7
  
  // comparison of records
  ({int a, String b}) recordAB = (a: 10, b: 'Hello');
  ({String c, int d}) recordCD = (c: 'World', d: 2);
  ({int x, String y}) recordXY = (x: 10, y: 'Hello');

  assert(recordAB == recordXY); // true, because the values of the fields are equal
  assert(recordAB == recordCD); // false, because the values of the fields are not equal

  (double, bool, {int a, String b}) recordA = (a: 10, b: 'Hello', 3.14, true);
  (bool, double, {String c, int d}) recordB = (c: 'Hello', d: 10, true, 3.14);

  // The order of the named fields does not matter when comparing records, as long as the values of the fields are equal. The order of the positional fields does matter, as they are compared based on their position in the record.
  assert(recordA == recordB); // true, because the values of the fields are equal

  (int, int) swap((int, int) pair) {
    var (a, b) = pair;
    return (b, a);
  }

  var swapped = swap((1, 2));
  print(swapped); // Output: (2, 1)

  // Returning multiple values from a function using records
  (int, String) getUserInfo(Map<String, dynamic> user) {
    // ?? is the null-aware operator, which returns the value on its left if it is not null, and the value on its right otherwise.
    int userId = user['id'] ?? 0;
    String userName = user['name'] ?? 'Unknown';
    return (userId, userName);
  }

  var userInfo = getUserInfo({'id': 123, 'name': 'John Doe'});
  var (userId, userName) = userInfo;
  print(userId); // Accessing the first field of userInfo
  print(userName); // Accessing the second field of userInfo
}

