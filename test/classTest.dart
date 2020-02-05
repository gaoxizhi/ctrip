import 'dart:math';

import 'package:ctrip/model/SomaTemp.dart';
import 'package:ctrip/model/SomaTempVO.dart';

void main(List<String> args) {
  SomaTempVO soma = SomaTempVO(12.1, 56);
  SomaTemp st = SomaTemp(1, 1, null, 1, 1);

  print(st);
  print(st ?? null);
  // 判断类型
  print(soma is SomaTempVO);
  // 强转为Object类型
  (st as SomaTempVO).printPublic();
  // 级联操作
  soma
    ..hum = 60
    ..temp = 5
    ..updateTime = DateTime.parse("2020-01-16");
  print(soma.toJson());
  soma = null;
  soma?.printPublic();

  //级联创建变量
  // SomaTemp st2 = (new SomaTempVO()
  //   ..hum = 9
  //   ..temp = 4
  //   ..updateTime = DateTime.parse("2020-01-16"));

  // var list = ['apples', 'bananas', 'oranges'];
  // list.forEach((item) {
  //   print('${list.indexOf(item)}: $item');
  //   for (int i = 0; i < item.length; i++) {
  //     print(item.codeUnitAt(i));
  //   }
  // });

  Point p = new Point(3, 4);
  print(p.x);
  Point p2 = Point(0, 0);
  print("p to p2 length is ${p.distanceTo(p2)}");
  print(p.runtimeType);
}
