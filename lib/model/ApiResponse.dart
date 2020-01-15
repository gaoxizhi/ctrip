class ApiResponse {
  SomaTempVO data;
  bool success;
  String msg;

  ApiResponse({this.data, this.success, this.msg});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SomaTempVO.fromJson(json['data']) : null;
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    data['msg'] = this.msg;
    return data;
  }
}

class SomaTempVO {
  double temp;
  double hum;
  String updateTime;

  SomaTempVO({this.temp, this.hum, this.updateTime});

  SomaTempVO.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    hum = json['hum'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['hum'] = this.hum;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
