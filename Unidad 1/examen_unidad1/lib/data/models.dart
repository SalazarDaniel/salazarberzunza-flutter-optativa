class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

class Cart {
  final int id;
  final int userId;
  final String date;

  Cart({required this.id, required this.userId, required this.date});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(id: json['id'], userId: json['userId'], date: json['date']);
  }
}

class ApiResponse<T> {
  final T data;
  final bool isMock;
  ApiResponse(this.data, this.isMock);
}
