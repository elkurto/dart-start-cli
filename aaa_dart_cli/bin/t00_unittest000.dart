import 'package:test/test.dart';

void main() {
  group("test-String", () {
    test('test-startsWith', () {
      String sFooBarBaz = "FOO BAR BAZ";
      expect(sFooBarBaz.startsWith("FOO"), isTrue);
    });

    test('test-endsWith', () {
      String sFooBarBaz = "FOO BAR BAZ";
      expect(sFooBarBaz.endsWith("BAZ"), isTrue);
    });
  });
}
