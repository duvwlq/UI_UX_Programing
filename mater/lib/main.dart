import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materal Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MateriaFlutterApp(),
    );
  }
}

class MateriaFlutterApp extends StatefulWidget {


  @override
  State<MateriaFlutterApp> createState(){
    return _MateriaFlutterApp();
  }
}

class _MateriaFlutterApp extends State<MateriaFlutterApp>{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text('Material Design App'),),
      floatingActionButton: FloatingActionButton(onPressed: () {  },
      child: Icon(Icons.add),),


    );
  }
}

