import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImp({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredencial.user;
    } on FirebaseException catch (e, s) {
      print(e);
      print(s);

//auth/email-already-exists
      throw AuthException(message: e.message ?? 'Erro ao acesso');
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredencial.user;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: e.message ?? 'Erro ao realizar o login');
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      if (e.code == 'wrong-password') {
        throw AuthException(message: e.message ?? 'Login ou senha inválido');
      }
      throw AuthException(message: e.message ?? 'Erro ao realizar o login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      var loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthException(message: 'Cadastro realizado pelo Google.');
      } else {
        throw AuthException(message: 'E-mail não cadastrado.');
      }
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: 'Erro ao resetar a senha');
    }
  }
  
  @override
  Future<User?> googleLogin() {
     
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
