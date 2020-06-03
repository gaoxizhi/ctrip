import 'dart:async';

import 'package:ctrip/navigator/TabNavigator.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  InitPage({Key key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: ConstrainedBox(
          //让他的child充满整个屏幕
          constraints: BoxConstraints.expand(),
          child: Stack(
            //
            children: <Widget>[
              Positioned(
                top: 50.0,
                right: 20.0,
                child: FlatButton(
                  color: Colors.green,
                  highlightColor: Colors.blue,
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text("跳过"),
                  onPressed: () {
                    //当点击跳过按钮的时候，则执行这边的代码，跳转到登录页，或者其他页面
                    closePage();
                  },
                ),
              ),
              Center(
                //这边放一张图用于显示5秒的底图，这张图和上面的图一样，这样就有连贯起来的效果了
                child: Text(
                  "天对地，雨对风。大陆对长空。山花对海树，赤日对苍穹。雷隐隐，雾蒙蒙,日下对天中。风高秋月白，雨霁晚霞红。" +
                      "牛女二星河左右，参商两曜斗西东。十月塞边，飒飒寒霜惊戍旅；三冬江上，漫漫朔雪冷渔翁。",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(seconds: 2), () {
      closePage();
    });
  }

  void closePage() {
    timer.cancel();
    try {
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new TabNavigator()),
          //跳转到主页，清空本阶段路由
          (Route route) => route == null);
    } catch (e) {
      print("跳过首页失败");
    }
  }
}
