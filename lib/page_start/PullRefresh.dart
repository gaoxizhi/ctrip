import 'package:flutter/material.dart';

void main() => runApp(RefreshView());

//列表
List<String> CITY_LIST = [
  "河北省",
  "山西省",
  "辽宁省",
  "吉林省",
  "黑龙省",
  "江苏省",
  "浙江省",
  "安徽省",
  "福建省",
  "江西省",
  "山东省",
  "河南省",
  "湖北省",
  "湖南省",
  "广东省",
  "海南省",
  "四川省",
  "贵州省",
  "云南省",
  "陕西省",
  "甘肃省",
  "青海省",
  "台湾省",
  "北京市",
  "上海市",
  "重庆市",
  "天津市",
  "广西壮族自治区",
  "宁夏回族自治区",
  "西藏自治区",
  "新疆维吾尔自治区",
  "内蒙古自治区",
  "香港",
  "澳门"
];

class RefreshView extends StatefulWidget {
  @override
  _AppView createState() => _AppView();
}

class _AppView extends State<RefreshView> {
  @override
  Widget build(BuildContext context) {
    final title = "模拟实现下拉刷新列表，数组倒置";
    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: RefreshIndicator(
            onRefresh: _han,
            child: ListView(children: _buildList()),
          ),
        ));
  }

  Future<Null> _han() async {
    await Future.delayed(Duration(microseconds: 500));
    setState(() {
      CITY_LIST = CITY_LIST.reversed.toList();
    });
    return null;
  }

  List<Widget> _buildList() {
    return CITY_LIST.map((city) => _item(city)).toList();
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
