import 'package:flutter/material.dart';
import 'mqtt_page.dart';

class EMQ extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MqttPage(title: 'EMQ Client'),
    );
  }
}
