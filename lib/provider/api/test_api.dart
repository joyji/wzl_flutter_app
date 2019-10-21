import 'package:flutter/material.dart';
import 'package:wzl_flutter_app/model/test.dart';
import 'package:wzl_flutter_app/utils/net_utils.dart';

class TestApi {

  Future<List<TestItem>> getMovieTopList(BuildContext context, int start, int count) async {
    final result = await NetUtils.request(context, 'https://douban.uieee.com/v2/movie/top250?start=${start}&count=${count}');

    // 3.转成模型对象
    final data = result.data;
    List<TestItem> movies = [];
    for (var sub in data["subjects"]) {
      movies.add(TestItem.fromJson(sub));
    }

    return movies;
  }
}