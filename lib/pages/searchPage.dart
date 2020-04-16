import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
        SizedBox(height: 200),
        SizedBox(height: 200, child: Text("搜索")),
        RaisedButton(
            child: Text("第二屏"),
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, '/second');
            }),
      ])),
    );
  }
}
