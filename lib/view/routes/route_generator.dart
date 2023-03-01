import 'package:concung_entrance_test/view/routes/route_name.dart';
import 'package:concung_entrance_test/view/screens/home_screen.dart';
import 'package:concung_entrance_test/view/screens/login_screen.dart';
import 'package:concung_entrance_test/view_model/login_provider.dart';
import 'package:concung_entrance_test/view_model/product_provider.dart';
import 'package:concung_entrance_test/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerateAppRoute(RouteSettings settings) {
    Widget? page;
    switch (settings.name) {
      case RouteName.login:
        page = MultiProvider(
          providers: [
            StateNotifierProvider<LoginProvider, LoginState>(
              create: (context) => LoginProvider(),
            ),
            StateNotifierProvider<RegisterProvider, RegisterState>(
              create: (context) => RegisterProvider(),
            )
          ],
          child: const LoginScreen(),
        );
        break;
      case RouteName.main:
        page = StateNotifierProvider<ProductProvider, ProductState>(
          create: (context) => ProductProvider(),
          child: const HomeScreen(),
        );
        break;
    }

    return _getPageRoute(page, settings);
  }

  static PageRouteBuilder<dynamic>? _getPageRoute(
    Widget? page,
    RouteSettings settings,
  ) {
    if (page == null) {
      return null;
    }
    return PageRouteBuilder<dynamic>(
      pageBuilder: (_, __, ___) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 350),
      transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
