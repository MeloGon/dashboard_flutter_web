import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  void login(String email, String password) {
    final data = {'correo': email, 'password': password};
    CafeApi.httpPost('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      if (authResponse.token == null || authResponse.token!.isEmpty) {
        NotificationsService.showSnackbarError('El token es invalido');
        return;
      }
      LocalStorage.prefs.setString('token', authResponse.token!);
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners(); //para que se redibuje etc etc
    }).catchError((e) {
      NotificationsService.showSnackbarError('Credenciales invalidas');
    });
  }

  void register(String name, String email, String password) {
    final data = {'nombre': name, 'correo': email, 'password': password};
    CafeApi.httpPost('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token!);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Usuario / Password no validos');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromJson(resp);
      LocalStorage.prefs.setString('token', authResponse.token!);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
