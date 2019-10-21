import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/utils/navigator_util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  FormState为Form的State类， 可以通过 Form.of() 或GlobalKey获得；可以通过它来对FormField进行统一操作
  final _formKey = new GlobalKey<FormState>();
  String _phone, _password;
  bool _isObscure = true;
  Color _eyeColor;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22),
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight,
            ),
            buildTitle(),
            SizedBox(height: 70,),
            buildPhoneTextField(context),
            buildPasswordTextField(context),
            SizedBox(height: 60,),
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 42),
      ),
    );
  }

  TextFormField buildPhoneTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '请输入手机号',
      ),
      validator: (String value) {
//        var emailReg = RegExp(
//            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
//        if (!emailReg.hasMatch(value)) {
//          return '请输入正确的邮箱地址';
//        }
      },
      onSaved: (String value) => _phone = value,
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '请输入登录密码',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye, color: _eyeColor),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
                _eyeColor = _isObscure ? Colors.grey : Theme.of(context).iconTheme.color;
              });
            }
        )
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: RaisedButton(
          child: Text('登录',),
          textColor: Colors.white,
          color: Colors.black,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              //  只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //  TODO 执行登录方法
              print('phone: $_phone, password: $_password');
              NavigatorUtil.goBasePage(context);
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

}
