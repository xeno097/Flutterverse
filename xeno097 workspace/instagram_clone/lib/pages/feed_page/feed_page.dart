import 'package:flutter/material.dart';
import 'package:instagram_clone/common/post.dart';

class FeedPage extends StatelessWidget {
  final List<Map> data = [
    {
      'id': 1,
      'likes': 1497,
      'account_name': 'Helados Bon',
      'url':
          'https://s3.amazonaws.com/cdn.restaurantes.conectate.com.do/wp-content/uploads/2018/03/22192304/heladosbon2.jpg',
      'comments': ['blslakala', 'vlskskkdskas']
    },
    {
      'id': 2,
      'likes': 5302,
      'account_name': 'Valentino',
      'url': 'https://pbs.twimg.com/media/B0gAlkzCcAAOi6Y.jpg',
      'comments': ['blslakala', 'vlskskkdskas']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.camera_alt,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Instagram Clone',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.message,
            ),
          )
        ],
      ),
      body: ListView(
        children: _contentViewer(),
      ),
    );
  }

  List<Widget> _contentViewer() {
    List<Widget> ret = new List();

    for (var i in data) {
      ret.add(Post(postData: i));
    }
    return ret;
  }
}
