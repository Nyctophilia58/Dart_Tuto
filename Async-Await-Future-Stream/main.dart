void main () {
  // fetchData();

  // fetchDataWithFuture();

  // Using the stream to get data
  // getData().listen((data) {
  //   print('Received data: $data');
  // });

  // Converting a Future to a Stream
  futureToStream().listen((data) {
    print('Received data from futureToStream: $data');
  });

  // Converting a Stream to a Future
  streamToFuture().then((data) {
    print('Received data from streamToFuture: $data');
  });
}

// This function simulates an asynchronous operation
void fetchData() async {
  print('Fetching data...');
  /* 
  The await keyword is used to pause the execution of the fetchData function until the Future returned by Future.delayed completes.
  Any await expression must be inside an async function, which is why fetchData is marked as async.
  Future represents a potential value or error that will be available at some time in the future. In this case, Future.delayed creates a Future that completes after a specified duration (5 seconds in this case).
  */
  await Future.delayed(Duration(seconds: 5));
  print('Data fetched');
}

// This function demonstrates the use of Future without async/await
Future <void> fetchDataWithFuture() {
  print('Fetching data...');
  // without using await, we can use the then method to register a callback that will be called when the Future completes.
  // The then method takes a function as an argument, which will be executed when the Future completes successfully.
  Future.delayed(Duration(seconds: 5)).then((_) {
    print('Data fetched');
  });
  // The function returns a Future that completes immediately, allowing the caller to continue executing other code while waiting for the asynchronous operation to complete.
  return Future.value();
}

Stream<int> getData() async* {
  // This function simulates a stream of data that emits values over time.
  // The async* keyword is used to indicate that this function returns a Stream.
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // The yield keyword is used to emit a value from the stream.
  }
}

Future<int> futureValue() async {
  await Future.delayed(Duration(seconds: 3));
  return 42;
}

// This function converts a Future to a Stream using the asStream method.
Stream<int> futureToStream() {
  return futureValue().asStream();
}

// This function converts a Stream to a Future using the first method.
Future<int> streamToFuture() {
  return getData().first;
}

/*
stream and future detail
A Future can be thought of as a single value that will be available at some point in the future, while a Stream can be thought of as a series of values that will be available over time.
A Future can be completed with a value or an error, while a Stream can emit multiple values and can also be closed with an error or a done event.
A Future can be converted to a Stream using the asStream method, and a Stream can be converted to a Future using the first or last methods.
A Future can be awaited using the await keyword, while a Stream can be listened to using the listen method.
A Future can be used to represent a single asynchronous operation, such as fetching data from a server while a Stream can be used to represent a continuous flow of data, such as user input or network events.

A stream can be transformed using various operators, such as map, where, and reduce, to create new streams based on the original stream.
A stream can be combined with other streams using operators such as merge, zip, and combineLatest to create new streams that emit values based on the values emitted by the original streams.
*/
