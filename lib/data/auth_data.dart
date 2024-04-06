// auth_data.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_to_do_list/data/firestor.dart';

abstract class AuthenticationDatasource {
  Future<void> register(String email, String password, String PasswordConfirm);
  Future<void> login(String email, String password);
}

class AuthenticationRemote extends AuthenticationDatasource {

  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  @override
  Future<void> register(
      String email, String password, String PasswordConfirm) async {
    if (PasswordConfirm == password) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim()
        );
        Firestore_Datasource().CreateUser(email);
      } catch (error) {
        if (error is FirebaseAuthException) {
          if (error.code == 'email-already-in-use') {
            // Handle email already in use error here
            print('The email address is already in use.');
            // You can display a message to the user indicating the email is already in use
          }
        }
      }
    }
  }
}
