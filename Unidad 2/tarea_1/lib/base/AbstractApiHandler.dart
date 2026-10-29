import 'package:http/http.dart' as http;

import 'CustomException.dart';

abstract class AbstractApiHandler {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<String> get(String endpoint) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl$endpoint'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return response.body;
      }
      throw CustomException('Error en servidor HTTP: ${response.statusCode}');
    } catch (e) {
      throw CustomException('Fallo de conexión o timeout: $e');
    }
  }
}
