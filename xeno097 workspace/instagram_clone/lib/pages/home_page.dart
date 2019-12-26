import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/router.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<StatefulWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: router(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems(),
        type: BottomNavigationBarType.fixed,
        onTap: _indexSetter,
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavBarItems() {
    List<BottomNavigationBarItem> ret = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black), title: Text('')),
      BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.black), title: Text('')),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_box, color: Colors.black), title: Text('')),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.black),
        title: Text(''),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.black),
          title: Text(''))
    ];

    return ret;
  }

  _indexSetter(int index) {
    setState(() {
      this._index = index;
      print(index);
    });
  }
}
