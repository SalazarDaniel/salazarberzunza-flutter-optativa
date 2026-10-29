import 'dart:convert';

import '../base/AbstractApiHandler.dart';
import '../base/Response.dart';
import 'Cart.dart';

class CartsApi extends AbstractApiHandler {
  static const String mockCartsJson = '''
  [
    {
      "id": 1,
      "userId": 1,
      "date": "2020-03-02T00:00:00.000Z",
      "products": [
        {"productId": 1, "quantity": 4},
        {"productId": 2, "quantity": 1},
        {"productId": 3, "quantity": 6}
      ],
      "__v": 0
    },
    {
      "id": 2,
      "userId": 1,
      "date": "2020-01-02T00:00:00.000Z",
      "products": [
        {"productId": 2, "quantity": 4},
        {"productId": 1, "quantity": 10},
        {"productId": 5, "quantity": 2}
      ],
      "__v": 0
    },
    {
      "id": 3,
      "userId": 2,
      "date": "2020-01-02T00:00:00.000Z",
      "products": [
        {"productId": 2, "quantity": 4}
      ],
      "__v": 0
    },
    {
      "id": 4,
      "userId": 3,
      "date": "2020-01-02T00:00:00.000Z",
      "products": [
        {"productId": 2, "quantity": 4}
      ],
      "__v": 0
    }
  ]
  ''';

  Future<AppResponse<List<Cart>>> fetchCarts() async {
    try {
      final body = await get('/carts');
      Iterable l = json.decode(body);
      List<Cart> list = l.map((model) => Cart.fromJson(model)).toList();
      return AppResponse(data: list, isMock: false);
    } catch (e) {
      Iterable l = json.decode(mockCartsJson);
      List<Cart> list = l.map((model) => Cart.fromJson(model)).toList();
      return AppResponse(data: list, isMock: true, message: e.toString());
    }
  }
}
