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
SomaTempVO _content = new SomaTempVO();
Timer timer;
Function notice;

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
    notice = () {
      if (mounted) {
        setState(() {});
      }
    };
    _content.temp = 0;
    _content.hum = 0;
    _content.updateTime = DateTime(2020, 1, 1, 0, 0, 0);
    print("initStateBegin:${new DateTime.now()}");
    timerTask();
    print("initStateEnd:${new DateTime.now()}");
    super.initState();
  }
}

void whenTaskCompelete() {
  print("Task Complete");
}

void getRequest() async {
  var response = await dio.get("http://iot.gaox.site/somaTemp/value/7");
  ApiResponse api = ApiResponse.fromJson(response.data);
  _content = SomaTempVO.fromJson(api.data);
}

void timerTask() {
  new Future(() => null) //  异步任务的函数
      .then((_) {
    if (null == timer) {
      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
        if (null != notice) {
          notice();
        }
        getRequest();
        // DateTime times = (DateTime.now()).toLocal();
        // var soma = _content.updateTime;
        // print("$times[===>$soma");
        //取消定时器方法
        // (timer as Timer).cancel();
      });
    }
  }).whenComplete(() => whenTaskCompelete); //  当所有任务完成后的回调函数
}
