// todo: https://dart.dev/language/constructors
// https://dart.dev/language/constructors#constant-constructors
import 'dart:collection';

// const Map<String, String> constMap = {}; // declare and use global map -- might just as well be static

class ArgResult {
  //final Map<String,String> mapNameArg =HashMap(); // fails with error about non-const initial value.
  //final Map<String,String> mapNameArg ={}; // fails with error about non-const initial value.

  // final Map<String, String> mapNameArg = constMap; // strangely okay
  static final Map<String, String> mapNameArg =HashMap();  // also okay

  const ArgResult(); // const ctor have no-body

  ArgResult initFromListString(List<String> args) {
    String arg;
    for (int i =0 ; i < args.length; i++ ) {
      
      arg =args[i];
      if ( arg.startsWith("-")) {
        
        if (args.length > i+1 ) {
          if (args[i+1].startsWith("-")) {
            mapNameArg[arg] ="";
          }else {
            mapNameArg[arg] =args[i+1];
            i += 1;
          }
        }else {
          mapNameArg[arg] ="";
        }
      }
    }//end for 
    return this;
  }

  factory ArgResult.fromListString(List<String> args) {
    const ArgResult argResult = ArgResult();
    argResult.initFromListString(args);
    return argResult;
  }

  bool hasKey(String key) {
    return mapNameArg.containsKey(key);
  }

  String? getVal(String key) {
    String? val =null;
    if ( hasKey(key)) {
      val =mapNameArg[key];
    }

    return val;
  }

  String toString() {
    StringBuffer sb =StringBuffer();
    for ( var key in mapNameArg.keys) {
      sb.writeln( "  ${key} =${mapNameArg[key]}");
    }
    return sb.toString();
  }
}

const USAGE ="""
USAGE: 
dart 008_02_constructors.dart -i aye -o oooot -a
  // output:
  argResult =
    -a =
    -o =oooot
    -i =aye
""";

void main(List<String> args) {
  ArgResult argResult = ArgResult.fromListString(args);
  
  if (argResult.hasKey("-h")) {
    print(USAGE);
  }else {
    print("argResult =\n${argResult.toString()}");
  }


}
