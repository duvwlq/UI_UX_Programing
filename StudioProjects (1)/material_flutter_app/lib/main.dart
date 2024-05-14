import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materal Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterFlutterApp(),
    );
  }


}

class MaterFlutterApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MaterFlutterApp();
  }
}

class _MaterFlutterApp extends State<MaterFlutterApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Materal Flutter App'),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: (){

      },),
      body: Container(
        child: Center(
        child: Column(
          children: <Widget>[
            Icon(Icons.android),
            Text('android')
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        )
      ),

    );
  }

}