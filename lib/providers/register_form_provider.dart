import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  void validateRegisterForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... register');
    } else {
      print('Form not valid');
    }
  }
}
