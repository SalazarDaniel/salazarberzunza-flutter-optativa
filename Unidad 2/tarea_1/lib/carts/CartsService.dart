import '../base/AbstractServiceHandler.dart';
import '../base/Response.dart';
import 'CartsApi.dart';
import 'Cart.dart';

class CartsService implements AbstractServiceHandler<AppResponse<List<Cart>>> {
  final CartsApi _api = CartsApi();

  @override
  Future<AppResponse<List<Cart>>> execute() async {
    return await _api.fetchCarts();
  }
}
