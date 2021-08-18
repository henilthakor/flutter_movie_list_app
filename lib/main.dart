import 'package:flutter/material.dart';
import 'package:movie_list_flutter/edit.dart';
import 'package:movie_list_flutter/home.dart';
import 'package:movie_list_flutter/movies.dart';
import 'package:movie_list_flutter/add.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>('mymovies');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
      routes: {
        'add': (context) => Add(),
        'edit': (context) => Edit(),
      },
    );
  }
}
