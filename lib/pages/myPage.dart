import 'dart:async';

import 'package:ctrip/model/ApiResponse.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

Dio dio;
SomaTempVO _content = new SomaTempVO();
int count = 0;

class _MyPageState extends State<MyPage> {
  void updateContent() {
    getRequest();
    if (mounted) {
      setState(() {
        _content = _content;
        count = count;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("温度："), Text(_content.temp.toString())],
            ),
            Row(
              children: <Widget>[Text("湿度："), Text(_content.hum.toString())],
            ),
            Row(children: <Widget>[Text("时间："), Text(_content.updateTime)]),
            Row(children: <Widget>[Text("请求："), Text(count.toString())])
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _content.temp = 0;
    _content.hum = 0;
    _content.updateTime = "暂无时间";
    getRequest();
    print("initStateBegin:${new DateTime.now()}");
    main();
    print("initStateEnd:${new DateTime.now()}");
    super.initState();
  }

  void main() {
    new Future(() => null) //  异步任务的函数
        .then((_) {
      var timer;
      timer = Timer.periodic(const Duration(milliseconds: 1000), (Void) {
        DateTime times = (DateTime.now()).toLocal();
        var soma = _content.updateTime;
        count++;
        print("$times[===>$soma");
        updateContent();
        //取消定时器方法
        // (timer as Timer).cancel();
      });
    }).whenComplete(() => whenTaskCompelete); //  当所有任务完成后的回调函数
  }
}

void whenTaskCompelete() {
  print("Task Complete");
}

void getRequest() async {
  Dio dio = new Dio();
  var response = await dio.get("http://iot.gaox.site/somaTemp/value/7");
  var map = new Map<String, dynamic>.from(response.data);
  ApiResponse api = ApiResponse.fromJson(map);
  _content = api.data;
}
