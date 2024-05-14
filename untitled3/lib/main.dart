import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'image/image1.jpg',
    'image/image2.jpg',
    'image/image3.jpg',
  ];

  List<String> displayedImages = [];

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: textController,
            onChanged: (text) {
              if (text == 'RANDOM') {
                _showRandomImages();
              } else if (text == 'CLEAN') {
                _clearImages();
              } else
                print('다시 입력하기');
            },
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _showImage(0),
                child: Text('IMAGE1'),
              ),
              ElevatedButton(
                onPressed: () => _showImage(1),
                child: Text('IMAGE2'),
              ),
              ElevatedButton(
                onPressed: () => _showImage(2),
                child: Text('IMAGE3'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          for (var image in displayedImages)
            Image.asset(
              image,
              height: 200.0,
            ),
        ],
      ),
    );
  }

  void _showImage(int index) {
    setState(() {
      displayedImages.clear();
      displayedImages.add(images[index]);
    });
  }

  void _showRandomImages() {
    setState(() {
      displayedImages.clear();
      images.shuffle();
      displayedImages.addAll(images);
    });
  }

  void _clearImages() {
    setState(() {
      displayedImages.clear();
    });
  }


}
