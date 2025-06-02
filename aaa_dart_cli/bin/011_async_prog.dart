import 'dart:io';

Future<void> main(List<String> args) async {
  print("aaaa");

  longPressSleep(); // a synchronous wait
  longPressFuture(); // an async wait
  print("done with longPressSleep and longPressFuture");

  // a. runing an async-wrapper "createUserAsync" around an async fn
  //    works 100% asynchronously.
  //    Preferred implementation
  print("calling createUserAsync");
  createUserAsync(2, "baz", true);
  print("called createUserAsync");

  /// b. Running an async method that returns future in main-thread.
  Future<User> futureUser00 = createFutureWithReturnValue(0, 'foo', true);
  futureUser00.then((user00) => print("user00 =${user00.toString()}"));

  // Awaiting async-methods in main
  //  just runs the method synchronously.
  /// c. don't do this
  User user01 = await createFutureWithReturnValue(1, 'bar', true);
  print("user01 =${user01.toString()}");
  print("done main");
}

longPressSleep() {
  int millis = 1000;
  print("waiting $millis ms");
  sleep(Duration(milliseconds: 1000));
  print("in longPressSleep -- done waiting in longPressSleep");
}

longPressFuture() {
  int millis = 1000;
  Future.delayed(Duration(milliseconds: millis), () {
    print("in longPressFuture -- done with future delay of $millis ms");
  });
}

class User {
  int? id;
  String? name;
  bool active = false;

  User({this.id, this.name = '', this.active = false});

  @override
  String toString() {
    return "User(id=$id,name=$name)";
  }
}

void createUserAsync(int id, String name, bool active) async {
  User user = await createFutureWithReturnValue(id, name, active);
  print("in createUserAsync user =${user.toString()}");
}

Future<User> createFutureWithReturnValue(int id, String name, bool active) {
  int millis = 1000;

  return Future<User>.delayed(Duration(milliseconds: millis), () {
    return User(id: id, name: name, active: active);
  });
}
