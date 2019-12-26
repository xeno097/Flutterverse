import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_page.dart';

class InstagramClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      home: HomePage(),
    );
  }
}
