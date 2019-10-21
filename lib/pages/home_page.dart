import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/provider/api/test_api.dart';
import 'package:wzl_flutter_app/model/test.dart';
import 'package:wzl_flutter_app/pages/movie_list_item.dart';


const COUNT = 20;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // 初始化首页的网络请求对象
  TestApi testApi = TestApi();

  int _start = 0;
  List<TestItem> movies = [];

  @override
  void initState() {
    super.initState();

    // 请求电影列表数据
    getMovieTopList(context, _start, COUNT);
  }

  void getMovieTopList(context, start, count) {
    testApi.getMovieTopList(context, start, count).then((result) {
      print('巴巴爸爸bbbbbbbbbb===${result}');
      // setState(() {
      //   movies.addAll(result);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('sss');
//    return ListView.builder(
//        itemCount: movies.length,
//        itemBuilder: (BuildContext context, int index) {
//          return MovieListItem(movies[index]);
//        }
//    );
  }
}
