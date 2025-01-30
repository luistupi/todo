import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({required UserService userService})
      : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> googleLogin() async {
    showLoadingAndResetState();
    infoMessage = null;
    notifyListeners();

    final user = await _userService.googleLogin();

    sucess();
  }

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      infoMessage = null;

      final user = await _userService.login(email, password);

      if (user != null) {
        sucess();
      } else {
        setError('O usuario ou senha invalido');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoadin();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      await _userService.forgotPassword(email);
      infoMessage = 'Reset de senha enviado para seu e-mail';
    } catch (e) {
      if (e is AuthException) {
        setError(e.message);
      }

      setError('Erro ao resetar a senha ');
    } finally {
      hideLoadin();
      notifyListeners();
    }
    //Messages.of(context)
  }
}
