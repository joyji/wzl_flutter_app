import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wzl_flutter_app/application.dart';
import 'package:wzl_flutter_app/utils/navigator_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _logoController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
//    //  2s后跳转到主页面
//    Future.delayed(Duration(milliseconds: 500), () {
//      NavigatorUtil.goLoginPage(context);
//    });
    _scaleTween = Tween(begin: 0, end: 1);
    _logoController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500), () {
      _logoController.forward();
    });
    _logoAnimation = CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);

    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 1000), () {
          NavigatorUtil.goLoginPage(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ScaleTransition(scale: _logoAnimation, child: Hero(tag: 'logo', child: Image.asset('images/icon_logo.png'))),
      ),
    );

  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }


}