class Item {
  final int id;
  final String name;

  Item(this.id, this.name);
}

class CartModel {
  final Map<int, Item> mapIdItem = {};

  // 1. private named constructor
  //
  CartModel._internal();

  // 2. static final field that refers to the singleton instance
  static final CartModel _instance = CartModel._internal();

  // 3. static getter to allow clients to retreive instance
  static CartModel get instance => _instance;

  // 4. business methods
  void addItem(Item item) {
    mapIdItem[item.id] = item;
  }

  void removeItem(Item item) {
    mapIdItem.remove(item.id);
  }
}

class Cart {
  final CartModel cartModel = CartModel.instance;
}
