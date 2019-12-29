import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Search",
          ),
        ),
      ),
      body: Center(
        child: TextField(),
      ),
    );
  }
}
