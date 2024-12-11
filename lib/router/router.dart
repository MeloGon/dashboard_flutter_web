import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  // Auth Router
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';

  // dashboard
  static String dashboardRoute = '/dashboard';

  // Auth Routes
  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

    //router.define(registerRoute, handler: handler);
  }
}
