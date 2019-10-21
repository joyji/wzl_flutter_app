import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/pages/my_page.dart';
import 'package:wzl_flutter_app/pages/home_page.dart';
import 'package:wzl_flutter_app/pages/business_page.dart';


/// 底部页面+导航
class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage> {

  // 默认颜色 未选中
  final Color _defaultColor = Colors.grey;

  // 选中状态下颜色
  final Color _activeColor = Color.fromARGB(1, 240, 90, 35); //f05a23

  // 当前索引 选中 控制选中哪个页面
  int _currentIndex = 0;

  // 管理pageView
  final PageController _controller = PageController(
    initialPage: 0,//初始页面
  );

  BottomNavigationBarItem createItem(String iconName, String title, int index) {
    return BottomNavigationBarItem(
        icon: Image.asset("images/tabbar/${iconName}.png", width: 30,),//Icon(Icons.account_circle,color: _defaultColor,), //未选中
        activeIcon: Image.asset("images/tabbar/${iconName}_active.png", width: 30,),//Icon(Icons.account_circle,color: _activeColor,),//选中
        title: Text(title,style: TextStyle(
          color: _currentIndex != index ? _defaultColor : _activeColor,
        ),)
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),//关闭整个页面的联动
        controller: _controller,
        // children显示得是页面 四个主页面
        children: <Widget>[
          HomePage(),
          BusinessPage(),
          MyPage(),
        ],
      ),

      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
//              backgroundColor: store.state.themeData.primaryColor,
          currentIndex: _currentIndex, //当前索引 第几页
          onTap: (index){ //切换当前索引
            setState(() {
              _controller.jumpToPage(index);//跳转到相印页面
              _currentIndex = index;
            });
          },
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,//将item固定
          items: [
            createItem("home", "首页", 0),
            createItem("business", "业务", 1),
            createItem("profile", "我的", 2)
            // 首页item
//              BottomNavigationBarItem(
//                  icon: Icon(Icons.home,color: _defaultColor,), //未选中
//                  activeIcon:Icon(Icons.home,color: _activeColor,),//选中
//                  title: Text("首页",style: TextStyle(
//                    color: _currentIndex != 0 ? _defaultColor : _activeColor,
//                  ),)
//              ),
//
//              // 搜索item
//              BottomNavigationBarItem(
//                  icon: Icon(Icons.search,color: _defaultColor,), //未选中
//                  activeIcon:Icon(Icons.search,color: _activeColor,),//选中
//                  title: Text("业务",style: TextStyle(
//                    color: _currentIndex != 1 ? _defaultColor : _activeColor,
//                  ),)
//              ),
//
//              // 我的item
//              BottomNavigationBarItem(
//                  icon: Icon(Icons.account_circle,color: _defaultColor,), //未选中
//                  activeIcon:Icon(Icons.account_circle,color: _activeColor,),//选中
//                  title: Text("我的",style: TextStyle(
//                    color: _currentIndex != 2 ? _defaultColor : _activeColor,
//                  ),)
//              ),
          ]

      ),
    );
  }
}