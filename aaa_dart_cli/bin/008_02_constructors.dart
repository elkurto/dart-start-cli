// todo: https://dart.dev/language/constructors
// https://dart.dev/language/constructors#constant-constructors
import 'dart:collection';

const Map<String, String> constMap = {}; // declare

class ArgResult {
  //final Map<String,String> mapNameArg =HashMap(); // fails with error about non-const initial value.
  //final Map<String,String> mapNameArg ={}; // fails with error about non-const initial value.

  final Map<String, String> mapNameArg = constMap; // strangely okay

  const ArgResult(); // const ctor have no-body

  ArgResult initFromListString(List<String> args) {
    return this;
  }

  factory ArgResult.fromListString(List<String> args) {
    const ArgResult argResult = ArgResult();

    return argResult;
  }
}

void main(List<String> args) {
  ArgResult argResult = ArgResult().initFromListString(args);
}
