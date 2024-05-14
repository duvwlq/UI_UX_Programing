import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatefulWidget {
  final Function(Animal) addAnimalCallback; // 첫 번째 탭으로 동물을 추가하기 위한 콜백 함수

  SecondApp({Key? key, required this.addAnimalCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SecondApp();
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  int? _radioValue = 0;
  bool? flyExist = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                children: <Widget>[
                  Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
                  Text('Insert'),
                  Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
                  Text('Plants'),
                  Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
                  Text('Animal'),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                children: <Widget>[
                  Text('Can it fly'),
                  Checkbox(
                    value: flyExist,
                    onChanged: (bool? check) {
                      setState(() {
                        flyExist = check;
                      });
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('repo/images/bee.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/cat.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/cow.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/dog.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/dog.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/monkey.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/pig.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/wolf.png', width: 80,),
                      onTap: () {
                        _imagePath = 'repo/images/wolf.png';
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add an Animal'),
                onPressed: () {
                  var animal = Animal(
                    animalName: nameController.value.text,
                    kind: getKind(_radioValue),
                    imagePath: _imagePath,
                    flyExist: flyExist,
                  );
                  AlertDialog dialog = AlertDialog(
                    title: Text('Add an Animal'),
                    content: Text(
                        'This is a ${animal.animalName}.\nWould you like add this animal?',
                        style: TextStyle(fontSize: 20 )),
                    actions: [
                      ElevatedButton(onPressed: (){
                        widget.addAnimalCallback(animal);
                        Navigator.of(context).pop();},
                          child: Text('yes')),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('no')),
                    ],
                  );
                  showDialog(context: context, builder: (BuildContext context)=>dialog);
                  // 첫 번째 탭으로 동물을 추가하는 콜백 함수 호출
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  String getKind(int? radioValue) {
    switch (radioValue) {
      case 0:
        return "Insert";
      case 1:
        return "Plants";
      case 2:
        return "Animal";
      default:
        return "";
    }
  }
}

