import 'package:ctrip/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

// This is added to route the logging info - which includes which file and where in the file
// the message came from.
void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    final List<Frame> frames = Trace.current().frames;
    try {
      final Frame f = frames.skip(0).firstWhere((Frame f) =>
          f.library.toLowerCase().contains(rec.loggerName.toLowerCase()) &&
          f != frames.first);
      print(
          '${rec.level.name}: ${f.member} (${rec.loggerName}:${f.line}): ${rec.message}');
    } catch (e) {
      print(e.toString());
    }
  });
}

void main() {
  initLogger();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //任务管理器中名称
      title: '携程',
      theme: ThemeData(
        //主题颜色：亮蓝色
        primarySwatch: Colors.lightBlue,
      ),
      //国际化配置
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      //支持语言列表
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      //配置初始化加载的路由
      initialRoute: '/',
      //路由表
      onGenerateRoute: onGenerateRoute,
      //关闭debug显示
      debugShowCheckedModeBanner: false,
    );
  }
}
