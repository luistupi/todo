import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
   
   final UserService _userService;

  RegisterController({required UserService userservice})
      : _userService = userservice;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      final user = await _userService.register(email, password);

      if (user != null) {
        sucess();
      } else {
        setError('Erro ao registrar o usuário');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoadin();
      notifyListeners();
    }
  }
}
