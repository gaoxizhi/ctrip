import 'package:flutter/material.dart';

void main() => runApp(AppView());

//列表
const CITY_LIST = [
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

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "城市列表";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return CITY_LIST.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
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
