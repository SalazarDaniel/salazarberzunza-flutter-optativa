import '../base/AbstractApiHandler.dart';

class LoginApi extends AbstractApiHandler {
  Future<bool> authenticate(String username, String password) async {
    // Simulamos latencia de red para el login
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }
}
