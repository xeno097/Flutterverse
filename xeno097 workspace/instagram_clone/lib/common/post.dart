import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final Map postData;

  const Post({this.postData});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int _likes = 0;
  List<String> _comments;
  bool _liked = false;
  String _account_name = '';

  @override
  void initState() {
    super.initState();
    this._likes = widget.postData['likes'];
    this._comments = widget.postData['comments'];
    print(this._comments.length);
    this._account_name = widget.postData['account_name'];
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
              Expanded(child: Text('${this._account_name}')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.tune),
              )
            ],
          ),
          FadeInImage(
            image: NetworkImage(widget.postData['url']),
            placeholder: AssetImage('assets/loading.gif'),
            fadeInDuration: Duration(milliseconds: 1000),
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
          Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: Text(
                '${this._account_name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            alignment: Alignment.topLeft,
            child: this._comments.length > 0
                ? Text(
                    'View all ${this._comments.length} comments',
                    style: TextStyle(color: Colors.grey),
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
