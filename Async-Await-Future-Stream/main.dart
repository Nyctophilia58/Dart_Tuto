void main () {
  // fetchData();

  // fetchDataWithFuture();

  // Using the stream to get data
  getData().listen((data) {
    print('Received data: $data');
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

