import 'package:concung_entrance_test/data/repository/user_repository.dart';
import 'package:concung_entrance_test/utils/dependency_injection.dart';
import 'package:concung_entrance_test/view/routes/route_generator.dart';
import 'package:concung_entrance_test/view/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  final initialRoute = await _getInitialRoute();
  runApp(LoginProject(initialRoute: initialRoute));
}

class LoginProject extends StatefulWidget {
  const LoginProject({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  State<LoginProject> createState() => _LoginProjectState();
}

class _LoginProjectState extends State<LoginProject> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "mobile shop",
          onGenerateRoute: RouteGenerator.onGenerateAppRoute,
          initialRoute: widget.initialRoute,
        );
      },
    );
  }
}

Future<String> _getInitialRoute() async {
  try {
    final instance = UserRepositoryImpl.instance();
    final isLoggedIn = await instance.getSession();
    return !isLoggedIn ? RouteName.login : RouteName.main;
  } catch (e) {
    return RouteName.login;
  }
}
