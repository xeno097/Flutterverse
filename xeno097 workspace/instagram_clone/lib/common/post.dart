import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final Map postData;

  const Post({this.postData});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int _likes = 0;
  List<String> comments;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    this._likes = widget.postData['likes'];
    this.comments = widget.postData['comments'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              Expanded(child: Text('profile_name')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.tune),
              )
            ],
          ),
          Image(
            image: NetworkImage(widget.postData['url']),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(_liked ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  if (this._liked) {
                    this._likes--;
                    this._liked = false;
                  } else {
                    this._likes++;
                    this._liked = true;
                  }
                  setState(() {});
                },
              ),
              IconButton(
                icon: Icon(Icons.mode_comment),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              ),
              Expanded(child: SizedBox()),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            alignment: Alignment.topLeft,
            child: this._likes > 0
                ? Text(
                    '${this._likes} likes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}