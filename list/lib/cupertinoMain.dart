import 'package:flutter/cupertino.dart';

class CupertinoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain>{
  CuperTinoTabBar? tabBar;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CUpertinoTabScaffold(tabBar: null, tabBuilder: null),
    );
  }
  @override

  void initState(){
    super.initState();
    tabBar = CupertinoTabBar(items:<BottomNavigatBarItem>[
      BottomNavigationBarItem(icon: Icon(cupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(cupertinoIcons.add)),
    ])
  }

}