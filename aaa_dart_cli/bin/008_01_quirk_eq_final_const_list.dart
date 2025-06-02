// 008_01_quirk_eq_final_const_list.dart

void main(List<String> args) {
  final listFinal00 = [0, 1, 2];
  final listFinal01 = [0, 1, 2];

  // note:   (listFinal00 == listFinal01) === false
  if (listFinal00 == listFinal01) {
    // does
    print("final ::: $listFinal00 == $listFinal01  is true");
  } else {
    // executes
    print("final ::: $listFinal00 == $listFinal01  is false");
  }

  const listConst00 = [0, 1, 2];
  const listConst01 = [0, 1, 2];
  const listConst02 = [3, 4, 5];

  // note:   (listConst00 == listConst01) === false
  if (listConst00 == listConst01) {
    // does
    print("const ::: $listConst00 == $listConst01  is true");
  } else {
    // executes
    print("const ::: $listConst00 == $listConst01  is false");
  }

  // note:   (listConst00 == listConst02) === false
  if (listConst00 == listConst02) {
    // does
    print("const ::: $listConst00 == $listConst02  is true");
  } else {
    // executes
    print("const ::: $listConst00 == $listConst02  is false");
  }
}
