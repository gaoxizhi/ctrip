class SomaTempVO {
  double temp;
  double hum;
  DateTime updateTime;

  //初始化列表
  // SomaTempVO(): temp = 0.0, hum = 0.0, updateTime = DateTime(2020, 1, 1, 0, 0, 0) {}

  //默认构造方法
  // SomaTempVO({this.temp, this.hum, this.updateTime});

  //自定义，可变参数构造方法
  SomaTempVO(double temp, double hum, [DateTime updateTime]) {
    this.temp = temp;
    this.hum = hum;
    this.updateTime = updateTime;
    if (null == updateTime) {
      this.updateTime = DateTime(2020, 1, 1, 0, 0, 0);
    }
  }
  String toString() => '$updateTime 上传温度：$temp ℃，湿度$hum%。';

  //公有方法：没有标志
  printPublic() {
    _printInner();
  }

  /// 私有方法：下划线开头
  /// 单行方法的简写形式
  _printInner() => print(toJson());

  //json转换器
  SomaTempVO.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    hum = json['hum'];
    updateTime = DateTime.parse(json['updateTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['hum'] = this.hum;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
