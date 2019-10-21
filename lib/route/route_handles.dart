//  路由规则配置文件

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/pages/splash_page.dart';
import 'package:wzl_flutter_app/pages/login/login_page.dart';
import 'package:wzl_flutter_app/pages/base_page.dart';

//  slash页面
var splashHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return SplashPage();
  }
);

//  登录页面
var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return LoginPage();
  }
);

//  跳转到主页
var baseHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return BasePage();
  }
);
