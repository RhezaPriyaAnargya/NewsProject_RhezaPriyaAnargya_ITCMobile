import 'package:get/get.dart';
import 'package:miniprojectitc/pages/detail_article.dart';
import 'package:miniprojectitc/pages/hero_page.dart';
import 'package:miniprojectitc/pages/home_page.dart';
import 'package:miniprojectitc/pages/login.dart';
import 'package:miniprojectitc/pages/navigation_bar.dart';
import 'package:miniprojectitc/pages/profile.dart';
import 'package:miniprojectitc/pages/signup.dart';
import 'package:miniprojectitc/routes/app_routes_named.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: AppRoutesNamed.hero,
      page: () => const HeroPage(),
    ),

    GetPage(
      name: AppRoutesNamed.login,
      page: () => const LoginPage(),
    ),

    GetPage(
      name: AppRoutesNamed.register,
      page: () => const RegisterPage(),
    ),

    GetPage(
      name: AppRoutesNamed.home,
      page: () => const HomePage(),
    ),

    GetPage(
      name: AppRoutesNamed.detail,
      page: () => const DetailNewsPage(),
    ),

    GetPage(
      name: AppRoutesNamed.profile,
      page: () => const Profile(),
    ),


    


    GetPage(
      name: AppRoutesNamed.buttomNavBar,
      page: () => const BottomNavigation(),
    ),

  ];
}