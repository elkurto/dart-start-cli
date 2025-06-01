import 'dart:io';

Future<void> main(List<String> args) async {
  print("aaaa");

  longPressSleep(); // a synchronous wait
  longPressFuture(); // an async wait

  Future<User> futureUser00 = createFutureWithReturnValue(0);
  futureUser00.then((user00) => print("user00 =${user00.toString()}"));

  User user01 = await createFutureWithReturnValue(1);
  print("user01 =${user01.toString()}");
  print("bbbb");
}

longPressSleep() {
  int millis = 1000;
  print("waiting $millis ms");
  sleep(Duration(milliseconds: 1000));
  print("done waiting");
}

longPressFuture() {
  int millis = 1000;
  Future.delayed(Duration(milliseconds: millis), () {
    print("done with future delay of $millis ms");
    print("done");
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

Future<User> createFutureWithReturnValue(int id) {
  int millis = 1000;

  return Future<User>.delayed(Duration(milliseconds: millis), () {
    return User(id: id, name: 'foo', active: true);
  });
}
