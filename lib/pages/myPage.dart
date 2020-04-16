import 'dart:async';

import 'package:ctrip/model/ApiResponse.dart';
import 'package:ctrip/model/SomaTempVO.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

Dio dio = new Dio();
SomaTempVO _content = new SomaTempVO(0.0, 0.0);
Timer timer;

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("温度："),
                Text(_content.temp.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Text("湿度："),
                Text(_content.hum.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Text("时间："),
                Text(_content.updateTime.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //清除过时定时器
    timer = null;
    timerTask();
  }

  ///暂时离开页面
  @override
  void deactivate() {
    super.deactivate();
    //取消定时器方法
    timer.cancel();
  }

  void whenTaskCompelete() {
    print("Task Complete");
  }

  void getRequest() async {
    var response = await dio.get("http://iot.gaox.site/somaTemp/value/7");
    ApiResponse api = ApiResponse.fromJson(response.data);

    setState(() {
      _content = SomaTempVO.fromJson(api.data);
    });
  }

  void timerTask() {
    new Future(() => null) //  异步任务的函数
        .then((aa) {
      if (null == timer) {
        timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
          getRequest();
        });
      }
    }).catchError((onError) {
      print("catchError" + onError);
    });
  }
}
