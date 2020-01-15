class SomaTempVO {
  double temp;
  double hum;
  DateTime updateTime;

  SomaTempVO({this.temp, this.hum, this.updateTime});

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
