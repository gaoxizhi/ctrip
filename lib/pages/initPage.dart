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
      backgroundColor: Colors.yellow,
      body: StartApp(),
    );
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(seconds: 5), () {
      closePage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void closePage() {
    try {
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new TabNavigator()),
          //跳转到主页，清空本阶段路由
          (Route route) => route == null);
    } catch (e) {}
  }
}

class StartApp extends StatefulWidget {
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp>
    with SingleTickerProviderStateMixin {
  var loginState;

  AnimationController _animationController;
  Animation _animation;

  void initState() {
    super.initState();
    //创建动画控制器
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween(begin: 1.0, end: 1.0).animate(_animationController);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //这边的添加动画的监听，当动画5秒后的状态是completed完成状态，则执行这边的代码，跳转到登录页，或者其他页面
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    try {
      _animationController.dispose();
      print("调用销毁init界面");
    } catch (e) {
      print("调用销毁init界面失败！");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: ConstrainedBox(
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
                      // closePage();
                      this.dispose();
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
            )));
  }

  void closePage() {
    try {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) => new TabNavigator()),
          //跳转到主页，清空本阶段路由
          (Route route) => route == null);
    } catch (e) {}
  }
}
