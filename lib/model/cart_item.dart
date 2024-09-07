class CartItem {
  final String name;
  final String color;
  final String size;
  final int price;
  int quantity;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 0,
  });
}
