class Cell {
  int icol;
  int irow;

  Cell(this.icol, this.irow);
  factory Cell.makeOne(index, ncol, nrow) {
    return Cell(index % ncol, index / ncol);
  }

  @override
  String toString() {
    return "Cell($icol,$irow)";
  }
}

Iterable<Cell> createIterableOfCell(final int ncol, final int nrow) {
  int nelement = ncol * nrow;
  Iterable<Cell> iterable = Iterable.generate(
    nelement,
    (index) => Cell.makeOne(index, ncol, nrow),
  );
  return iterable;
}

void main(List<String> args) {
  List<Cell> listCell = List.of(createIterableOfCell(5, 5), growable: false);
}

/*
Loosely based on examples from 
https://api.flutter.dev/flutter/dart-core/Iterable/Iterable.generate.html.
But the example lacked context so I had to google and experiment.
I am not sure why it's so difficult to create a fixed length List<Object> in dart.
WTF 
*/
