import 'package:flutter/cupertino.dart';
import 'animalItem.dart';

class CupertinoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain>{
  CupertinoTabBar? tabBar;
  List<Animal> AnimalList =List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(tabBar: tabBar!,
          tabBuilder: (context,value){
        if (value==0){
          return Container(
            child: Center(
              child: Text('cupertino tab1'),
            ),
          );
        }else {
          return Container(
            child: Center(
              child: Text('cupertino tab2'),
            ),
          );
        }
          }
      ),
    );
  }
  @override

  void initState(){
    super.initState();
    tabBar = CupertinoTabBar(items:<BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ]);

    AnimalList.add(Animal(animalName: "bee",kind: "animal",imagePath:"repo/images/bee.png"));
    AnimalList.add(Animal(animalName: "cow",kind: "animal",imagePath:"repo/images/cow.png"));
    AnimalList.add(Animal(animalName: "cat",kind: "animal",imagePath:"repo/images/cat.png"));
    AnimalList.add(Animal(animalName: "fox",kind: "animal",imagePath:"repo/images/fox.png"));
    AnimalList.add(Animal(animalName: "dog",kind: "animal",imagePath:"repo/images/dog.png"));
    AnimalList.add(Animal(animalName: "monkey",kind: "animal",imagePath:"repo/images/monkey.png"));
    AnimalList.add(Animal(animalName: "wolf",kind: "animal",imagePath:"repo/images/wolf.png"));
    AnimalList.add(Animal(animalName: "pig",kind: "animal",imagePath:"repo/images/pig.png"));
  }

}