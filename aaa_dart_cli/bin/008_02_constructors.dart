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
      print( "i =${i} and args[${i}] =${args[i]}");
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

  String toString() {
    StringBuffer sb =StringBuffer();
    for ( var key in mapNameArg.keys) {
      sb.writeln( "  ${key} =${mapNameArg[key]}");
    }
    return sb.toString();
  }
}

void main(List<String> args) {
  ArgResult argResult = ArgResult.fromListString(args);
  print("argResult =\n${argResult.toString()}");
  
}
