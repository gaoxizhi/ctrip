import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(RefreshView());

//列表
List<String> baseList = [
  "山东省",
  "广东省",
  "四川省",
  "贵州省",
  "台湾省",
  "北京市",
  "广西壮族自治区",
  "西藏自治区",
  "新疆维吾尔自治区",
  "内蒙古自治区",
  "香港",
];
//列表
List<String> cityList = [
  "山东省",
  "广东省",
  "四川省",
  "贵州省",
  "台湾省",
  "北京市",
  "广西壮族自治区",
  "西藏自治区",
  "新疆维吾尔自治区",
  "内蒙古自治区",
  "香港",
];

class RefreshView extends StatefulWidget {
  @override
  _AppView createState() => _AppView();
}

class _AppView extends State<RefreshView> {
  //添加监听
  ScrollController _sc = ScrollController();
  //是否显示“返回到顶部”按钮
  bool showToTopBtn = false;
  @override
  void initState() {
    _sc.addListener(() {
      //监听底部
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _landData();
      }
      //当前位置距离初始顶部小于1000不显示回到顶部，并且显示图标
      if (_sc.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_sc.offset >= 1000 && showToTopBtn == false) {
        //当前位置距离初始顶部大于1000不显示回到顶部，并且不显示图标
        setState(() {
          showToTopBtn = true;
        });
      }
    });
    super.initState();
  }

//在Controller的生命周期结束时，销毁监听，提高性能
  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = "下拉刷新，上拉增加，返回顶部";
    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: RefreshIndicator(
            //下拉刷新
            onRefresh: _handleRefresh,
            child: ListView(
                //增肌滚动监听
                controller: _sc,
                children: _buildList()),
          ),
          floatingActionButton: !showToTopBtn
              ? null
              : FloatingActionButton(
                  child: Icon(Icons.arrow_upward),
                  onPressed: () {
                    //返回到顶部时执行动画
                    _sc.animateTo(.0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease);
                  }),
        ));
  }

  _landData() async {
    await Future.delayed(Duration(microseconds: 1000));
    setState(() {
      List<String> list;
      //Dart复制数组
      // list = List<String>.from(cityList);

      //随机复制数组
      int length = Random.secure().nextInt(6) + 2;
      print(length);
      Iterable<String> it = baseList.where((s) => s.runes.length == length);
      if (it.isNotEmpty) {
        list = it.toList();
        list.forEach((s) => print(s.toString()));
        list.addAll(cityList);
        cityList = list;
      }

      // cityList.add("关东省");
    });
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 500));
    setState(() {
      cityList = cityList.reversed.toList();
    });
    return null;
  }

  List<Widget> _buildList() {
    return cityList.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      width: 600,
      height: 80,
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Text(
        city,
        maxLines: 1,
        // 显示不完，就在后面显示点点
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
