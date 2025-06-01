import 'dart:collection';
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
  print("\n runListExample() :::: ");

  List<int> list = [5, 7, 11, 13, 17, 19];
  list.add(23);

  int summation = list.reduce((val, elem) => val + elem);
  print("  ${list.join(" + ")} = $summation\n");
  // output:
  //   5 + 7 + 11 + 13 + 17 + 19 + 23 = 95
}

runSetExample() {
  print("\n runSetExample() :::: ");

  List<String> listString = <String>["a", "bb", "ccc", "dddd", "eeeee"];
  Set<String> hashSet = HashSet.of(listString);

  print("\n  hashSet ={");

  for (String elem in hashSet) {
    print("    elem =$elem ,");
  }
  print("  }");
}

runMapExample() {
  print("\n runMapExample() ::::");
  Map<String, int> hashMap = HashMap();
  hashMap.addAll({"a": 1, "b": 2, "c": 3});

  print("\n  hashMap ={");
  for (String key in hashMap.keys) {
    print("    $key = ${hashMap[key]}");
  }
  print("  })");
}

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

/*
dart bin/002_collections.dart list set map

 runListExample() :::: 
  5 + 7 + 11 + 13 + 17 + 19 + 23 = 95


 runSetExample() :::: 

  hashSet ={
    elem =eeeee ,
    elem =a ,
    elem =bb ,
    elem =ccc ,
    elem =dddd ,
  }

 runMapExample() ::::

  hashMap ={
    c = 3
    a = 1
    b = 2
  })

 */
