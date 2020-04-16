import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SecondPage> {
  int countNum = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(children: <Widget>[
      SizedBox(height: 200),
      Chip(
        label: Text('${this.countNum}'),
      ),
      SizedBox(height: 20),
      RaisedButton(
        child: Text("按钮"),
        onPressed: () {
          setState(() {
            this.countNum++;
          });
        },
      )
    ]));
  }
}
