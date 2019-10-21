import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/application.dart';
import 'package:wzl_flutter_app/provider/api/user_api.dart';
import 'package:wzl_flutter_app/model/user.dart';

class UserModel with ChangeNotifier {
  User _user;
  User get user => _user;

  //  初始化User
  void initUser() {
    if (Application.sp.containsKey('user')) {
      String s = Application.sp.getString('user');
      _user = User.fromJson(json.decode(s));
    }
  }

  //  登录
  void login(BuildContext context, String phone, String password) async {
    User user = await UserApi.login(context, phone, password);
  }
}