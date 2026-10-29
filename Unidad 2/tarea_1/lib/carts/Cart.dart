class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({required this.productId, required this.quantity});

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }
}

class Cart {
  final int id;
  final int userId;
  final String date;
  final List<CartProduct> products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var productsList = json['products'] as List? ?? [];
    List<CartProduct> parsedProducts = productsList
        .map((p) => CartProduct.fromJson(p))
        .toList();

    return Cart(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      date: json['date'] ?? '',
      products: parsedProducts,
    );
  }
}
