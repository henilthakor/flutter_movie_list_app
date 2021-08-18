import 'package:flutter/material.dart';
import 'package:movie_list_flutter/movielist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("My Movie List"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                semanticLabel: 'Add Movie',
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'add');
              })
        ],
      ),
      body: MovieList(),
    );
  }
}
