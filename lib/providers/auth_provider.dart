import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  void login(String email, String password) {
    // TODO: Peticion http
    _token = 'fsndkfjndsfndsf.kgdofvwe3';
    LocalStorage.prefs.setString('token', _token!);
    print('almacenar JWT:${_token}');
    // TODO: navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners(); //para que se redibuje etc etc
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    //isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
