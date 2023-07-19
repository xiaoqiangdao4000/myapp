import 'package:get/get.dart';
import 'package:myapp/app/modules/home/home_binding.dart';
import 'package:myapp/app/modules/home/home_view.dart';
import 'package:myapp/app/modules/homepage/homepage_controller.dart';
import 'package:myapp/app/modules/homepage/homepage_view.dart';
import 'package:myapp/app/modules/login/login_binding.dart';
import 'package:myapp/app/modules/login/login_view.dart';
import 'package:myapp/app/modules/register/register_binding.dart';
import 'package:myapp/app/modules/register/register_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
