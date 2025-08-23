import "package:aaa_dart_cli/aad_grid.dart";
import "package:test/test.dart";

void main() {
  group("test-Grid", () {
    test("Grid ctor", () {
      Grid grid = Grid(3, 6);
      expect(grid.ncol, 3);
      expect(grid.nrow, 6);
    });
  });
}
