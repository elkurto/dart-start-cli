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

/*
Run with the command : 
   dart t00_unittest000.dart 

   Output:
    00:00 +0: test-String test-startsWith

    00:00 +1: test-String test-endsWith

    00:00 +2: All tests passed!
 */
