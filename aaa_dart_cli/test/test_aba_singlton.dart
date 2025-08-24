import "package:test/test.dart";
import "package:aaa_dart_cli/aba_singleton.dart";

main() {
  group("test aba_singleton:::", () {
    test("Singleton create", () {
      CartModel cartModelInstance = CartModel.instance;
      expect(cartModelInstance, isNotNull);
      expect(cartModelInstance.mapIdItem.isEmpty, isTrue);

      CartModel cartModelInstanceB = CartModel.instance;
      expect(cartModelInstance, cartModelInstanceB);
    });

    test("Cart:: add remvoe", () {
      CartModel cartModelInstance = CartModel.instance;
      Item item1 = Item(1, "chile sauce");
      cartModelInstance.addItem(item1);

      expect(cartModelInstance.mapIdItem[1], item1);

      cartModelInstance.removeItem(item1);
      expect(cartModelInstance.mapIdItem.isEmpty, isTrue);
    });
  });
}

/*
Run: 
  dart test/test_aba_singlton.dart 

  Output
    00:00 +0: test aba_singleton Singleton create

    00:00 +1: test aba_singleton Cart:: add remvoe

    00:00 +2: All tests passed!


Run:
  dart test test/test_aba_singlton.dart 
  
  Output:
    00:00 +2: All tests passed!     
*/
