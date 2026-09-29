class MockData {
  static const String productDetail = '''
  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest...",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": { "rate": 3.9, "count": 120 }
  }
  ''';

  static const String carts = '''
  [
    { "id": 1, "userId": 1, "date": "2020-03-02T00:00:00.000Z", "products": [ {"productId": 1, "quantity": 4} ], "__v": 0 },
    { "id": 2, "userId": 1, "date": "2020-01-02T00:00:00.000Z", "products": [ {"productId": 2, "quantity": 4} ], "__v": 0 },
    { "id": 3, "userId": 2, "date": "2020-01-02T00:00:00.000Z", "products": [ {"productId": 2, "quantity": 4} ], "__v": 0 },
    { "id": 4, "userId": 3, "date": "2020-01-02T00:00:00.000Z", "products": [ {"productId": 2, "quantity": 4} ], "__v": 0 },
    { "id": 5, "userId": 3, "date": "2020-01-02T00:00:00.000Z", "products": [ {"productId": 2, "quantity": 4} ], "__v": 0 },
    { "id": 6, "userId": 4, "date": "2020-01-02T00:00:00.000Z", "products": [ {"productId": 2, "quantity": 4} ], "__v": 0 },
    { "id": 7, "userId": 8, "date": "2020-01-02T00:00:00.000Z", "products": [ {"productId": 2, "quantity": 4} ], "__v": 0 }
  ]
  ''';

  static const String products = '''
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
}
