import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  bool validateRegisterForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... register');
      print('$email === $password');
      return true;
    } else {
      print('Form not valid');
      return false;
    }
  }
}
