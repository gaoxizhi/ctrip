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
        child: ListView(children: <Widget>[
          SizedBox(height: 200),
          SizedBox( child: Center(child: Text("搜索"))),
          SizedBox(
            // height: 20,
            child: Center(
              child: RaisedButton(
                  child: Text("第二屏"),
                  onPressed: () {
                    //路由跳转
                    Navigator.pushNamed(context, '/second');
                  }),
            ),
          ),
          SizedBox(
            // height: 20,
            child: Center(
              child: RaisedButton(
                  child: Text("MQTT Demo"),
                  onPressed: () {
                    //路由跳转

                    Navigator.pushNamed(context, '/mqtt',
                        arguments: "MQTT Demo");
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
