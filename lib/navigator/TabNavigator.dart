import 'package:ctrip/pages/MyPage.dart';
import 'package:ctrip/pages/SearchPage.dart';
import 'package:ctrip/pages/TravelPage.dart';
import 'package:flutter/material.dart';
import 'package:ctrip/pages/HomePage.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> {
  //没选中状态下显示黑色
  final _defaultColor = Colors.grey;
  //选中状态下显示蓝色
  final _activeColor = Colors.blue;
  //显示哪个底部bar
  int _currentIndex = 0;
  final PageController _controller = PageController(
    //初始情况下显示0界面
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
        //页面滑动时更新底部barr
        onPageChanged: (index) {
          //改变选择的页面id
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //底部bar设置
      bottomNavigationBar: BottomNavigationBar(
        //当前选中的哪个
        currentIndex: _currentIndex,
        //点击时切换
        onTap: (index) {
          //跳转对应的页面
          _controller.jumpToPage(index);
          //改变选择的页面id
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          //首页页面
          BottomNavigationBarItem(
              //未激活时颜色
              icon: Icon(
                Icons.home,
                color: _defaultColor,
              ),
              //激活状态图标和颜色
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(
                    color: _currentIndex != 0 ? _defaultColor : _activeColor),
              )),
          //搜索页面
          BottomNavigationBarItem(
              //未激活时颜色
              icon: Icon(
                Icons.search,
                color: _defaultColor,
              ),
              //激活状态图标和颜色
              activeIcon: Icon(
                Icons.search,
                color: _activeColor,
              ),
              title: Text(
                '搜索',
                style: TextStyle(
                    color: _currentIndex != 1 ? _defaultColor : _activeColor),
              )),
          //旅拍页面
          BottomNavigationBarItem(
              //未激活时颜色
              icon: Icon(
                Icons.camera_alt,
                color: _defaultColor,
              ),
              //激活状态图标和颜色
              activeIcon: Icon(
                Icons.camera_alt,
                color: _activeColor,
              ),
              title: Text(
                '旅拍',
                style: TextStyle(
                    color: _currentIndex != 2 ? _defaultColor : _activeColor),
              )),
          //我的页面
          BottomNavigationBarItem(
              //未激活时颜色
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              //激活状态图标和颜色
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex != 3 ? _defaultColor : _activeColor),
              )),
        ],
      ),
    );
  }
}
