import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';
import '../core/mock_data.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<ApiResponse<List<Product>>> getProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        return ApiResponse(
          List<Product>.from(l.map((model) => Product.fromJson(model))),
          false,
        );
      }
      throw Exception('Failed API');
    } catch (e) {
      print('🔴 Error en getProducts: $e');
      Iterable l = json.decode(MockData.products);
      return ApiResponse(
        List<Product>.from(l.map((model) => Product.fromJson(model))),
        true,
      );
    }
  }

  Future<ApiResponse<Product>> getProductDetail(int id) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products/$id'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return ApiResponse(Product.fromJson(json.decode(response.body)), false);
      }
      throw Exception('Failed API');
    } catch (e) {
      print('🔴 Error en getProductDetail: $e');
      return ApiResponse(
        Product.fromJson(json.decode(MockData.productDetail)),
        true,
      );
    }
  }

  Future<ApiResponse<List<Cart>>> getCarts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/carts'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        return ApiResponse(
          List<Cart>.from(l.map((model) => Cart.fromJson(model))),
          false,
        );
      }
      throw Exception('Failed API');
    } catch (e) {
      print('🔴 Error en getCarts: $e');
      Iterable l = json.decode(MockData.carts);
      return ApiResponse(
        List<Cart>.from(l.map((model) => Cart.fromJson(model))),
        true,
      );
    }
  }
}
