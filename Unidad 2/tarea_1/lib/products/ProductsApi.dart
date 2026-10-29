import 'dart:convert';

import '../base/AbstractApiHandler.dart';
import '../base/Response.dart';
import 'Product.dart';

class ProductsApi extends AbstractApiHandler {
  static const String mockProductsJson = '''
  [
    {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": 109.95,
      "description": "Your perfect pack for everyday use and walks in the forest.",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      "rating": { "rate": 3.9, "count": 120 }
    },
    {
      "id": 2,
      "title": "Mens Casual Premium Slim Fit T-Shirts",
      "price": 22.3,
      "description": "Slim-fitting style, contrast raglan long sleeve...",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      "rating": { "rate": 4.1, "count": 259 }
    }
  ]
  ''';

  Future<AppResponse<List<Product>>> fetchProducts() async {
    try {
      final body = await get('/products');
      Iterable l = json.decode(body);
      List<Product> list = l.map((model) => Product.fromJson(model)).toList();
      return AppResponse(data: list, isMock: false);
    } catch (e) {
      Iterable l = json.decode(mockProductsJson);
      List<Product> list = l.map((model) => Product.fromJson(model)).toList();
      return AppResponse(data: list, isMock: true, message: e.toString());
    }
  }
}
