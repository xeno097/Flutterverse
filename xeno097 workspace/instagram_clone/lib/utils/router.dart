import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/add_page/add_page.dart';
import 'package:instagram_clone/pages/feed_page/feed_page.dart';
import 'package:instagram_clone/pages/notifications_page/notifications_page.dart';
import 'package:instagram_clone/pages/profile_page/profile_page.dart';
import 'package:instagram_clone/pages/search_page/search_page.dart';

Widget router(int index) {
  List<Widget> pages = [
    FeedPage(),
    SearchPage(),
    AddPage(),
    NotificationsPage(),
    ProfilePage()
  ];
  return pages[index];
}
