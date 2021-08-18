import 'package:flutter/material.dart';
import 'package:movie_list_flutter/movies.dart';
import 'package:hive/hive.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Movie'),
      ),
      body: Addform(),
    );
  }
}

class Addform extends StatefulWidget {
  @override
  _AddformState createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  @override
  Widget build(BuildContext context) {
    final _MovieNameController = TextEditingController();
    final _DirectorNameController = TextEditingController();
    final _MoviePosterController = TextEditingController();
    Widget _addMovie(String name, String director, String posterLink) {
      var movie = new Movie(name, director, posterLink);
      final box = Hive.box<Movie>('mymovies');
      box.add(movie);
      Navigator.pop(context);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Enter Movie Name',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )),
            controller: _MovieNameController,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Enter Director Name',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )),
            controller: _DirectorNameController,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Movie Poster Link',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )),
            controller: _MoviePosterController,
          ),
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
              onPressed: () => _addMovie(_MovieNameController.text,
                  _DirectorNameController.text, _MoviePosterController.text),
              child: Text(
                'Add and Go Back',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )),
        ],
      ),
    );
  }
}
