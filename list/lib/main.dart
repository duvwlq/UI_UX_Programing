import 'package:flutter/material.dart';
import 'package:list/sub/firstPage.dart';
import 'package:list/sub/secondPage.dart';
import './animalItem.dart';
import './cupertinoMain.dart';

void main() {
  //runApp(const MyApp());
  runApp(CupertinoMain());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbar Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = new List.empty(growable: true);

  @override
  Widget build(BuildContext context){
      return Scaffold(
      appBar: AppBar(
      title: Text('ListView Example'),
    ),
    body: TabBarView(
    children: <Widget>[FirstApp(list: animalList),SecondApp()],
    controller: controller,
    ),
    bottomNavigationBar: TabBar(
    tabs: <Tab>[
      Tab(icon: Icon(Icons.looks_one, color: Colors.blue,),),
      Tab(icon: Icon(Icons.looks_two, color: Colors.blue,),)
    ],controller: controller,
    ),
    );
  }

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName: "bee",kind: "animal",imagePath:"repo/images/bee.png"));
    animalList.add(Animal(animalName: "cow",kind: "animal",imagePath:"repo/images/cow.png"));
    animalList.add(Animal(animalName: "cat",kind: "animal",imagePath:"repo/images/cat.png"));
    animalList.add(Animal(animalName: "fox",kind: "animal",imagePath:"repo/images/fox.png"));
    animalList.add(Animal(animalName: "dog",kind: "animal",imagePath:"repo/images/dog.png"));
    animalList.add(Animal(animalName: "monkey",kind: "animal",imagePath:"repo/images/monkey.png"));
    animalList.add(Animal(animalName: "wolf",kind: "animal",imagePath:"repo/images/wolf.png"));
    animalList.add(Animal(animalName: "pig",kind: "animal",imagePath:"repo/images/pig.png"));
  }

  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }

}
