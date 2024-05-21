import 'package:flutter/material.dart';
import './sub/firstPage.dart';
import './sub/secondPage.dart';
import './animalItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  List<Animal> animalList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(list: animalList),
          SecondApp(addAnimalCallback: addAnimalToList),
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue),)
        ],
        controller: controller,
      ),
    );
  }

  @override
  void initState() {
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
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  // 첫 번째 탭으로 동물을 추가하는 콜백 함수
  void addAnimalToList(Animal animal) {
    setState(() {
      animalList.add(animal);
    });
  }
}
