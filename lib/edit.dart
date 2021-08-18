import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_list_flutter/movies.dart';

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Movie Details')),
      body: EditForm(),
    );
  }
}

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  var box;
  int key;
  @override
  void initState() {
    box = Hive.box<Movie>('mymovies');
    // TODO: implement initState
    super.initState();
  }

  final _newMovieName = new TextEditingController();
  final _newDirectorName = new TextEditingController();
  final _newMovieLink = new TextEditingController();
  void _editMovie(name, director, link, key) {
    box.put(key, Movie(name, director, link));
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    key = ModalRoute.of(context).settings.arguments as int;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _newMovieName..text = box.get(key).name,
            decoration: InputDecoration(
                labelText: 'New Movie Name',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          TextField(
            controller: _newDirectorName..text = box.get(key).director,
            decoration: InputDecoration(
                labelText: 'New Director Name',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          TextField(
            controller: _newMovieLink..text = box.get(key).posterLink,
            decoration: InputDecoration(
                labelText: 'New Movie Poster Link',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
              onPressed: () => _editMovie(_newMovieName.text,
                  _newDirectorName.text, _newMovieLink.text, key),
              child: Text(
                'Save and Back',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )),
        ],
      ),
    );
  }
}
