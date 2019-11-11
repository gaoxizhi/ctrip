import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // controller: _controller,
          child: Column(
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
          )
        ],
      )),
    );
  }
}
