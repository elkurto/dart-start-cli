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
