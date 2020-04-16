import 'package:ctrip/pages/initPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //任务管理器中名称
      title: '携程',
      theme: ThemeData(
        //主题颜色：亮蓝色
        primarySwatch: Colors.lightBlue,
      ),
      //设置主页
      home: InitPage(),
      //关闭debug显示
      debugShowCheckedModeBanner: false,
    );
  }
}
