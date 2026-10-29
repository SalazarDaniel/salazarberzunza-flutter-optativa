import '../base/AbstractServiceHandler.dart';
import '../base/Response.dart';
import 'ProductsApi.dart';
import 'Product.dart';

class ProductsService
    implements AbstractServiceHandler<AppResponse<List<Product>>> {
  final ProductsApi _api = ProductsApi();

  @override
  Future<AppResponse<List<Product>>> execute() async {
    return await _api.fetchProducts();
  }
}
