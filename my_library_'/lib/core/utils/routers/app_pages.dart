// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:get/get.dart';
import 'package:my_library/data/bindings/bindings.dart';
import 'package:my_library/presentation/entrance/email_vertification_lobby.dart/pages/email_vertification_lobby_screen.dart';
import 'package:my_library/presentation/entrance/login/pages/login_screen.dart';
import 'package:my_library/presentation/entrance/signup/pages/sign_up_screen.dart';
import 'package:my_library/presentation/in_app/add_card/pages/add_card_screen.dart';
import 'package:my_library/presentation/in_app/card_detail/pages/card_detail_screen.dart';
import 'package:my_library/presentation/in_app/category_detail/pages/category_detail_screen/category_detail_screen.dart';

import 'package:my_library/presentation/in_app/tabbar/tabbar_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.LOGIN_SCREEN_ROUTE;

  static final routes = [
    GetPage(
        name: Routes.LOGIN_SCREEN_ROUTE,
        page: () => LoginScreen(),
        binding: InitialBindings()),
    GetPage(
        name: Routes.SIGN_UP_SCREEN_ROUTE,
        page: () => SignUpScreen(),
        binding: InitialBindings()),
    GetPage(
        name: Routes.EMAIL_VERTIFICATION_LOBBY_SCREEN_ROUTE,
        page: () => EmailVertificationLobbyScreen(),
        binding: InitialBindings()),
    GetPage(
        name: Routes.TABBAR_SCREEN_ROUTE,
        page: () => TabbarScreen(),
        binding: InitialBindings()),
    GetPage(
      name: Routes.CATEGORY_DETAIL_SCREEN_ROUTE,
      page: () => CategoryDetailScreen(),
    ),
    GetPage(
      name: Routes.ADD_CARD_SCREE_ROUTE,
      page: () => AddCardScreen(),
      binding: InitialBindings(),
    ),
    GetPage(
      name: Routes.CARD_DETAIL_SCREEN_ROUTE,
      page: () => CardDetailScreen(),
      binding: InitialBindings(),
    )
  ];
}