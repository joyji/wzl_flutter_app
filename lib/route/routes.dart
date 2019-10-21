//  路由总体配置文件， 如根目录， 出现不存在的路径如何显示

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:wzl_flutter_app/route/route_handles.dart';
import 'package:wzl_flutter_app/pages/login/login_page.dart';

class Routes {
  static String root = '/'; //  根目录
  static String base = '/base';
  static String login = '/login';

  //  静态方法 - 路由配置
  static void configureRoutes(Router router) {
    //  找不到路由
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("Route is not found");
        return LoginPage();
      }
    );
    //  整体配置
    router.define(root, handler: splashHandler);
    router.define(login, handler: loginHandler);
    router.define(base, handler: baseHandler);
  }
}