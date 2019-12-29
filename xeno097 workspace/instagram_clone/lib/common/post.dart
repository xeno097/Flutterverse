import 'package:flutter/material.dart';
import 'package:instagram_clone/common/comments_page.dart';

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
  String _accountName = '';

  @override
  void initState() {
    super.initState();
    this._likes = widget.postData['likes'];
    this._comments = widget.postData['comments'];
    this._accountName = widget.postData['account_name'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Top post (avtar image, account name)
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              Expanded(child: Text('${this._accountName}')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.tune),
              )
            ],
          ),

          //Post Image
          GestureDetector(
            child: FadeInImage(
              image: NetworkImage(widget.postData['url']),
              placeholder: AssetImage('assets/loading.gif'),
              fadeInDuration: Duration(milliseconds: 1000),
            ),
            onDoubleTap: _likePost,
          ),

          //Post actions (like, comment, send)
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(_liked ? Icons.favorite : Icons.favorite_border),
                onPressed: _likePost,
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

          // Post like number
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

          //Account name and post description

          //TODO: add post description
          Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: Text(
                '${this._accountName}',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),

          // Comments section
          Container(
            padding: EdgeInsets.only(left: 8.0),
            alignment: Alignment.topLeft,
            child: this._comments.length > 0
                //Using gesture detector to route user to the comments
                //page when tapping on the total number of comments
                ? GestureDetector(
                    child: Text(
                      'View all ${this._comments.length} comments',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      final commentsPage = MaterialPageRoute(
                          builder: (context) => CommentsPage(this._comments));
                      Navigator.push(context, commentsPage);
                    },
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

  void _likePost() {
    if (this._liked) {
      this._likes--;
      this._liked = false;
    } else {
      this._likes++;
      this._liked = true;
    }
    setState(() {});
  }
}
