import 'dart:convert';

import '../base/AbstractApiHandler.dart';
import '../base/Response.dart';
import '../products/Product.dart';

class ProductByIdApi extends AbstractApiHandler {
  static const String mockProductJson = '''
  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": { "rate": 3.9, "count": 120 }
  }
  ''';

  Future<AppResponse<Product>> fetchProductById(int id) async {
    try {
      final body = await get('/products/$id');
      final map = json.decode(body);
      return AppResponse(data: Product.fromJson(map), isMock: false);
    } catch (e) {
      final map = json.decode(mockProductJson);
      return AppResponse(
        data: Product.fromJson(map),
        isMock: true,
        message: e.toString(),
      );
    }
  }
}
