import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final List<String> commentsData;

  const CommentsPage(this.commentsData);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<String> _comments;

  @override
  void initState() {
    super.initState();

    this._comments = widget.commentsData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: _listBuilder(),
      ),
    );
  }

  List<ListTile> _listBuilder() {
    List<ListTile> ret = new List();

    for (var comment in this._comments) {
      ret.add(ListTile(
        title: Text('$comment'),
      ));
    }

    return ret;
  }
}
