import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:wzl_flutter_app/application.dart';
import 'package:wzl_flutter_app/route/routes.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path, {
    bool replace = false,
    bool clearStack = false,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionsBuilder
  }) {
    Application.router.navigateTo(context, path,
      replace: replace,
      clearStack: clearStack,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionsBuilder,
      transition: TransitionType.material
    );
  }

  //  登录页
  static void goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.login, clearStack: true);
  }

  //  首页
  static void goBasePage(BuildContext context) {
    _navigateTo(context, Routes.base, clearStack: true);
  }

}