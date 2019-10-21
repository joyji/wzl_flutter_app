import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:wzl_flutter_app/route/navigate_service.dart';

class Application {
  static Router router; //  路由静态化，任何页面可直接调用
  static double screenWidth;
  static double screenHeight;
  static SharedPreferences sp;
  static GetIt getIt = GetIt.instance;

//  static GlobalKey<NavigatorState> key = GlobalKey();

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  static setupLocator() {
    getIt.registerSingleton(NavigateService());
  }
}