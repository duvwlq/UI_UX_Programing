import 'package:flutter/cupertino.dart';
import 'animalItem.dart';
import 'iosSub/cupertinoFirstPage.dart';
import 'iosSub/cupertinoSecondPage.dart';

class CupertinoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain>{
  CupertinoTabBar? tabBar;
  List<Animal> animalList =List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(tabBar: tabBar!,
          tabBuilder: (context,value){
        if (value==0){
              return CupertinoFirstPage(animalList: animalList);
        }else {
          return CupertinoSecondPage(animalList: animalList);
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

    animalList.add(Animal(animalName: "bee",kind: "animal",imagePath:"repo/images/bee.png"));
    animalList.add(Animal(animalName: "cow",kind: "animal",imagePath:"repo/images/cow.png"));
    animalList.add(Animal(animalName: "cat",kind: "animal",imagePath:"repo/images/cat.png"));
    animalList.add(Animal(animalName: "fox",kind: "animal",imagePath:"repo/images/fox.png"));
    animalList.add(Animal(animalName: "dog",kind: "animal",imagePath:"repo/images/dog.png"));
    animalList.add(Animal(animalName: "monkey",kind: "animal",imagePath:"repo/images/monkey.png"));
    animalList.add(Animal(animalName: "wolf",kind: "animal",imagePath:"repo/images/wolf.png"));
    animalList.add(Animal(animalName: "pig",kind: "animal",imagePath:"repo/images/pig.png"));
  }

}