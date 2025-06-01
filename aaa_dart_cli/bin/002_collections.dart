import 'dart:ffi';

class ArgResult {
  bool bRunListExample = false;
  bool bRunSetExample = false;
  bool bRunMapExample = false;

  static final constList = "list";
  static final constSet = "set";
  static final constMap = "map";

  // a factory method the converts args into an instance of ArgResult
  static parseArgs(List<String> args) {
    ArgResult argResult = ArgResult();
    for (String arg in args) {
      if (arg.contains(constList)) {
        argResult.bRunListExample = true;
        //
      } else if (arg.contains(constSet)) {
        argResult.bRunSetExample = true;
        //
      } else if (arg.contains(constMap)) {
        argResult.bRunMapExample = true;
        //
      }
    }
    return argResult;
  }
}

runListExample() {
  print("\nrunListExample()");
  List<int> list = [5, 7, 11, 13, 17, 19];
  list.add(23);
  int summation = list.reduce((val, elem) => val + elem);
  print("  ${list.join(" + ")} = $summation\n");
  // output:
  //   5 + 7 + 11 + 13 + 17 + 19 + 23 = 95
}

runSetExample() {}

runMapExample() {}
void main(List<String> args) {
  ArgResult argResult = ArgResult.parseArgs(args);

  if (argResult.bRunListExample) {
    runListExample();
  }
  if (argResult.bRunSetExample) {
    runSetExample();
  }
  if (argResult.bRunMapExample) {
    runMapExample();
  }
}
