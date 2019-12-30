import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final List<String> commentsData;
  final bool onHover;

  const CommentsPage(this.commentsData, this.onHover);

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
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: ListView(
        children: _listBuilder(),
      ),
      bottomNavigationBar: Padding(
        padding:
            //Using the MediaQuery class to detect when the keybord is on the screen
            //through the viewInsets property
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
          child: TextField(
            autofocus: widget.onHover,
            decoration: InputDecoration(
                //removes the undeline of the TextField
                border: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                )),
            onSubmitted: (inputText) {
              this._comments.add(inputText);

              setState(() {});
            },
          ),
        ),
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
