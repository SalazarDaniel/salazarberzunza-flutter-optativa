import '../base/AbstractServiceHandler.dart';
import '../base/Response.dart';
import 'ProductByIdApi.dart';
import '../products/Product.dart';

class ProductByIdService
    implements AbstractServiceHandler<AppResponse<Product>> {
  final ProductByIdApi _api = ProductByIdApi();
  final int productId;

  ProductByIdService(this.productId);

  @override
  Future<AppResponse<Product>> execute() async {
    return await _api.fetchProductById(productId);
  }
}
