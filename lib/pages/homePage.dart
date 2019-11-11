import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // final _defaultColor = Colors.grey;
  // final _activeColor = Colors.blue;
  // int _currentIndex = 0;
  final PageController _controller = PageController(
    //初始情况下显示0界面
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // controller: _controller,
          child: Text("首页")),
    );
  }
}
