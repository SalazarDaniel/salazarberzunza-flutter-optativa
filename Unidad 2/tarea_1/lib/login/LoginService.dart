import '../base/AbstractServiceHandler.dart';
import 'LoginApi.dart';
import 'UserCredentialDto.dart';

class LoginService implements AbstractServiceHandler<bool> {
  final LoginApi _api = LoginApi();
  final UserCredentialsDto credentials;

  LoginService(this.credentials);

  @override
  Future<bool> execute() async {
    return await _api.authenticate(credentials.username, credentials.password);
  }
}
