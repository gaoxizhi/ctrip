class ApiResponse {
  dynamic data;
  bool success;
  String msg;

  ApiResponse({this.data, this.success, this.msg});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? json['data'] : null;
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
