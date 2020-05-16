import 'package:ctrip/navigator/TabNavigator.dart';
import 'package:ctrip/pages/homePage.dart';
import 'package:ctrip/pages/initPage.dart';
import 'package:ctrip/pages/myPage.dart';
import 'package:ctrip/pages/routerPage/SecondPage.dart';
import 'package:ctrip/pages/searchPage.dart';
import 'package:ctrip/pages/travelPage.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ctrip/emq/mqtt_ui_page.dart';

Logger log = Logger('mqtt_stream.dart');

//路由表
final Map routes = {
  "/": (context) => TabNavigator(),
  "/homePage": (context) => HomePage(),
  "/searchPage": (context) => SearchPage(),
  "/travelPage": (context) => TravelPage(),
  "/myPage": (context) => MyPage(),
  "/second": (context) => SecondPage(),
  "/init": (context) => InitPage(),
  "/mqtt": (context, {arguments}) => MqttPage(title: arguments),
};
//路由加载
var onGenerateRoute = (settings) {
  //统一处理
  final String name = settings.name;
  log.info('change to $name');
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
