import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'mqtt_stream.dart';
import 'msg_feed.dart';
import 'package:ctrip/model/SomaTempVO.dart';

class MqttPage extends StatefulWidget {
  MqttPage({this.title});
  final String title;

  @override
  MqttPageState createState() => MqttPageState();
}

class MqttPageState extends State<MqttPage> {
  // Instantiate an instance of the class that handles
  // connecting, subscribing, publishing to Adafruit.io
  AppMqttTransactions myMqtt = AppMqttTransactions();
  final myTopicController = TextEditingController();
  final myValueController = TextEditingController();

  // 温湿度vo
  SomaTempVO _content;
  String reading =
      "{\"data\":{\"hum\":0.0,\"temp\":0.0,\"updateTime\":\"2020-01-01T00:00:00.000\"},\"success\":true}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
    subscribe("");
  }

  ///暂时离开页面
  @override
  void deactivate() {
    super.deactivate();
    // 暂停mqtt
  }

  //
  // The body of the page.  The children contain the main components of
  // the UI.
  Widget _body() {
    return ListView(
      children: <Widget>[
        _subscriptionInfo(),
        _subscriptionData(),
        _publishInfo(),
      ],
    );
  }

//
// The UI to get and subscribe to the mqtt topic.
//
  Widget _subscriptionInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Topic:',
                style: TextStyle(fontSize: 24),
              ),
              // To use TextField within a row, it needs to be wrapped in a Flexible
              // widget.  See Stackoverflow: https://bit.ly/2IkzqBk
              Flexible(
                child: TextField(
                  controller: myTopicController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter topic to subscribe to',
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Subscribe'),
            onPressed: () {
              subscribe(myTopicController.text);
            },
          ),
        ],
      ),
    );
  }

  Widget _subscriptionData() {
    return StreamBuilder(
        stream: MsgFeed.sensorStream,
        builder: (context, snapshot) {
          // if (!snapshot.hasData) {
          //   return CircularProgressIndicator();
          // }
          reading = snapshot.data;
          if (reading == null) {
            reading = 'no value is available';
            return Center(child: Text("reading"));
          } else {
            // json.decode(reading);
            try {
              _content =
                  SomaTempVO.fromJson(convert.jsonDecode(reading)['data']);
              return Center(
                // 嵌套ListView解决方案一
                child: ListView(
                  // 为true可以解决子控件必须设置高度的问题
                  shrinkWrap: true,
                  // 禁用滑动事件
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("温度："),
                        Text(_content.temp.toString()),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("湿度："),
                        Text(_content.hum.toString()),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("时间："),
                        Text(_content.updateTime.toString()),
                      ],
                    ),
                  ],
                ),
              );
            } catch (e) {
              print(e);
              if (e is FormatException) {
                return Center(child: Text("reading FormatException"));
              } else {
                return Center(child: Text("reading error"));
              }
            }
          }
        });
  }

  Widget _publishInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Value:',
                style: TextStyle(fontSize: 24),
              ),
              // To use TextField within a row, it needs to be wrapped in a Flexible
              // widget.  See Stackoverflow: https://bit.ly/2IkzqBk
              Flexible(
                child: TextField(
                    controller: myValueController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter value to publish',
                    ),
                    //内容提交(按回车)的回调
                    onSubmitted: (text) {
                      publish(myTopicController.text, text);
                      myValueController.text = "";
                    }),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Publish'),
            onPressed: () {
              publish(myTopicController.text, myValueController.text);
            },
          ),
        ],
      ),
    );
  }

  void subscribe(String topic) {
    myMqtt.subscribe(topic);
  }

  void publish(String topic, String value) {
    myMqtt.publish(topic, value);
  }
}

// void publish(String topic) {
// AppMqttTransactions mySubscribe = AppMqttTransactions();
// myPublish.publish(topic,3);
// }
