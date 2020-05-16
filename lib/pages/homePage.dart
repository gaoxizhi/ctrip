import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 常量区
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'http://dimg07.c-ctrip.com/images/100711000000r9tfbEF7C_C_221_166.jpg',
    'http://dimg08.c-ctrip.com/images/100k10000000p4vo315BD_C_221_166.jpg',
    'http://dimg01.c-ctrip.com/images/fd/tg/g1/M07/7A/98/CghzfVWwtayAcRE2ABaIuxjYffE235_C_221_166.jpg',
    'http://dimg05.c-ctrip.com/images/100b11000000qcd4zEAD7_C_221_166.jpg',
    'http://dimg01.c-ctrip.com/images/100m0u000000jqip1B411_C_221_166.jpg'
  ];

  final PageController _controller = PageController(
    //初始情况下显示0界面
    initialPage: 0,
  );

  //设置appBar标题透明度
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    //异常区域补偿
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    // 调整alpha通道，顶部透明度
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //全屏
          MediaQuery.removePadding(
            //移除顶部布局
            removeTop: true,
            context: context,
            //监听列表的滚动
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  //监听列表是否更新
                  //监听深度1：子组件的变化也会触发，只取第一层子元素组件
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    //控制组件大小
                    Container(
                      //设置宽高
                      height: 166,
                      width: 221,
                      //轮播图组件
                      child: Swiper(
                        //设置轮播图片数量
                        itemCount: _imageUrls.length,
                        //自动播放
                        autoplay: true,
                        //滚动时间间隔
                        autoplayDelay: 2000,
                        //每个banner（放置的图片，滚动位置）
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        //添加位置指示器
                        pagination: SwiperPagination(),
                      ),
                    ),
                    //控制组件大小
                    Container(
                      //设置宽高
                      height: 800,
                      child: ListTile(
                        title: Text("天下好走！"),
                      ),
                    ),
                    // Expanded(
                    //     child: TabBar(
                    //   //多个按钮可以滑动
                    //   isScrollable: true,
                    //   indicatorColor: Colors.yellow,
                    //   labelColor: Colors.yellow,
                    //   unselectedLabelColor: Colors.white,
                    //   //长度和字体保持一致
                    //   indicatorSize: TabBarIndicatorSize.label,
                    //   tabs: <Widget>[
                    //     Tab(text: "火车票"),
                    //     Tab(text: "汽车票"),
                    //     Tab(text: "机票"),
                    //     Tab(text: "船票"),
                    //     Tab(text: "景点"),
                    //     Tab(text: "乡村"),
                    //     Tab(text: "民宿"),
                    //   ],
                    // ))
                  ],
                )),
          ),
          //自定义个AppBar
          Opacity(
            //
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              //装饰器，背景色：白色
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("首页"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
