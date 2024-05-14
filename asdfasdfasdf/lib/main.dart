import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget { //StatefulWidget == 상태가 변경 될 수도 있다
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var switchValue = false;
  String test = '나의 학번은??'; // 이벤트로 변경 될 텍스트
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) { //위젯의 UI 생성
    return MaterialApp(
        title: 'UI/UX 프로그래밍',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
        body: Container(
        child: Center(
        child: Column(
    children: <Widget>[
    Padding(
        Padding: EdgeInset.all(5)
    ),
    ],
    ),
    ),
    );
    }
}