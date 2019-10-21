import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/model/user.dart';
import 'package:wzl_flutter_app/utils/net_utils.dart';

class UserApi {
  static Future<User> login(BuildContext context, String phone, String password) async {
    var response = await NetUtils.request(context, '/login/cellphone', params: {
      'phone': phone,
      'password': password
    });

    return User.fromJson(response.data);
  }
}