import 'SomaTempVO.dart';

/**
 * json Dart转换工具：https://javiercbk.github.io/json_to_dart/
 */
class SomaTemp extends SomaTempVO {
  int _id;
  int _eqId;

  SomaTemp(int id, int eqId, DateTime updateTime, double temp, double hum)
      : super(temp, hum, updateTime) {
    this._id = id;
    this._eqId = eqId;
    // this._updateTime = updateTime;
    // this._temp = temp;
    // this._hum = hum;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get eqId => _eqId;
  set eqId(int eqId) => _eqId = eqId;
  // int get updateTime => _updateTime;
  // set updateTime(int updateTime) => _updateTime = updateTime;
  // int get temp => _temp;
  // set temp(int temp) => _temp = temp;
  // int get hum => _hum;
  // set hum(int hum) => _hum = hum;

  SomaTemp.fromJson(Map<String, dynamic> json) : super.fromJson(null) {
    _id = json['id'];
    _eqId = json['eqId'];
    super.hum= json['hum'];
    super.temp = json['temp'];
    super.updateTime= json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['eqId'] = this._eqId;
    return data;
  }
}
